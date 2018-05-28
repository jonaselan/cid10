class WelcomeController < ApplicationController
  def index
    render json: { message: 'Bem vindo a API CID10!' }
  end
end
