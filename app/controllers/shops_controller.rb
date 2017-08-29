class ShopsController < ApplicationController
  def index
    shops = Shop.where(available: true)
    render json: shops, each_serializer: Shops::ListShopsSerializer
  end

  def show
    shop = Shop.friendly.find(params[:id])
    render json: shop, serializer: Shops::ShowShopsSerializer
  rescue
    error = { errors: 'Data not found' }
    render json: error, status: 404
  end
end
