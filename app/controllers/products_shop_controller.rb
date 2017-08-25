class ProductsShopController < ApplicationController
  def index
    products = Shop.friendly.find(params[:shop_id]).products.where(available: true)
    render json: products, each_serializer: Products::ProductsSerializer
  end
end
