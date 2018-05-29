class Group < ApplicationRecord
  belongs_to :chapter
  has_many :categories
end
