class ProductsBestSellerController < ApplicationController
  def index
    products = Product.includes(:images).best_seller
    render json: products, each_serializer: Products::ProductsSerializer
  end
end
