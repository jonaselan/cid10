class ApplicationController < ActionController::API
  def render_not_found
    render json: {
      code: 404,
      message: 'Nada encontrado!'
    }, status: :not_found
  end
end
