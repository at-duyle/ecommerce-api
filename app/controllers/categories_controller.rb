class CategoriesController < ApplicationController
  def index
    categories = Category.all
    render json: categories, each_serializer: Categories::ListCategoriesSerializer
  end
end
