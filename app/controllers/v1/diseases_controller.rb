class V1::DiseasesController < ApplicationController
  before_action :get_disease, only: [:show]

  def index
    @diseases = Category.all
    @diseases = params[:page] && params[:per_page]? paginate : @diseases.limit(10)
    search if params[:q]

    return render_not_found if @diseases.empty?
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
      @diseases = @diseases.search_by params[:q].delete(" \t\r\n")
    end

    def paginate
      @diseases.limit(params[:page]).offset(params[:per_page])
    end
end
