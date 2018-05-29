class V1::DiseasesController < ApplicationController
  before_action :get_disease, only: [:show]

  def index
    @diseases = Category.limit 10
    # @diseases = search if params[:q]
    # @diseases = @diseases.as_json(include: :group)
    render json: @diseases
  end

  def show
    render json: @disease.as_json(include: :group)
  end

    private

    def get_disease
      @disease = Category.find(params[:id])
    end

    def search
      @diseases.search_by params[:q].delete(" \t\r\n")
      # return render_not_found if @diseases.empty?
    end

end
