class ProductsController < ApplicationController
  def index
    products = Product.where(available: true)
    render json: products, each_serializer: Products::ProductsSerializer
  end
end
