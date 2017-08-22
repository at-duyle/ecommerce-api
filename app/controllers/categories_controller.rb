class CategoriesController < ApplicationController
  def index
    categories = Category.all
    if !categories.blank?
      render json: categories, each_serializer: Categories::ListCategoriesSerializer, adapter: :json, root: 'categories'
    else
      error = { error: 'Data empty' }
      render json: error, status: 404
    end
  end

  def products
    products = Product.where('categorical_id = ? and categorical_type = ?', params[:id], params[:type])
    if !products.blank?
      render json: products, each_serializer: Products::ProductsSerializer, adapter: :json, root: 'products'
    else
      message = { message: 'Out of products' }
      render json: message, status: 404
    end
  end
end
