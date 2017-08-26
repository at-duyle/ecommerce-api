class ProductsNewestController < ApplicationController
  def index
    products = Product.order(created_at: :desc).take(6)
    render json: products, each_serializer: Products::ProductsSerializer
  end
end
