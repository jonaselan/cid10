# Choose the official Ruby 2.4.1 image as our starting point
FROM ruby:2.5.1

# Run updates
RUN apt-get update -yqq \
    && apt-get install -y \
      # Needed for certain gems
    build-essential \
         # Needed for postgres gem
    libpq-dev \
         # Needed for asset compilation
    nodejs \
    # The following are used to trim down the size of the image by removing unneeded data
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log

# Set up working directory
RUN mkdir /myapp
WORKDIR /myapp

# Set up gems
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Finally, add the rest of our app's code
# (this is done at the end so that changes to our app's code
# don't bust Docker's cache)
COPY . /myapp
