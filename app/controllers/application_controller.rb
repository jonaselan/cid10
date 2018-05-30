class ApplicationController < ActionController::API

  def render_not_found
    render json: {
      código: 404,
      mensagem: 'Nada encontrado!'
    }, status: :not_found
  end

end
