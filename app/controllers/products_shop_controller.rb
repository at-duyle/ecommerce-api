class ProductsShopController < ApplicationController
  def index
    products = Product.friendly.where(shop_id: params[:shop_id], available: true)
    render json: products, each_serializer: Products::ProductsSerializer
  end
end
