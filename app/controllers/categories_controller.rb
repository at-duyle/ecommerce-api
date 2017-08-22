class CategoriesController < ApplicationController
  def index
    categories = Category.all
    if categories
      render json: categories, each_serializer: Categories::ListCategoriesSerializer, adapter: :json, root: 'categories'
    else
      error = { error: 'Data empty' }
      render json: error, status: 404
    end
  end
end
