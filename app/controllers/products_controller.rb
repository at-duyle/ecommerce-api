class ProductsController < ApplicationController
  def index
    products = Product.where('available = ?', true)
    if !products.blank?
      render json: products, each_serializer: Products::ProductsSerializer, adapter: :json, root: 'products'
    else
      error = { error: 'Data empty' }
      render json: error, status: 404
    end
  end
end
