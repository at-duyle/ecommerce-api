class ShopsController < ApplicationController
  def index
    shops = Shop.where('available = ?', true)
    if shops.blank?
      error = { error: 'Data empty' }
      render json: error, status: 404
    else
      render json: shops, each_serializer: Shops::ListShopsSerializer, adapter: :json, root: 'shops'
    end
  end

  def products
    products = Product.where('shop_id = ? and available = ?', params[:id], true)
    if products.blank?
      message = { message: 'Out of products' }
      render json: message, status: 404
    else
      render json: products, each_serializer: Products::ProductsSerializer, adapter: :json, root: 'products'
    end
  end
end
