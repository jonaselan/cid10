class V1::DiseasesController < ApplicationController
  before_action :get_disease, only: [:show]

  def index
    @diseases = Category.includes(:subcategories).all
    @diseases = params[:page] && params[:per_page]? paginate : @diseases.limit(10)
    search if params[:q]

    return render_not_found if @diseases.empty?
  end

  def show
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
