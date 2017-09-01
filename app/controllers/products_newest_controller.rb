class ProductsNewestController < ApplicationController
  def index
    products = Product.includes(:images).order(created_at: :desc).take(10)
    render json: products, each_serializer: Products::ProductsSerializer
  end
end
