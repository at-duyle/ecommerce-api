class ShopsController < ApplicationController
  def index
    shops = Shop.where(available: true)
    render json: shops, each_serializer: Shops::ListShopsSerializer
  end
end
