class CategoriesController < ApplicationController
  def index
    categories = Category.includes(:sub_categories).all
    render json: categories, each_serializer: Categories::ListCategoriesSerializer
  end
end
