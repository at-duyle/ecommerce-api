class DeliveryOrdersController < ApplicationController
  before_action :set_user, only: %i[index]

  def index
    if @current_user.blank?
      error = { errors: 'Please login!' }
      render json: error, status: 401
    else
      delivery_orders = DeliveryOrder.includes(products_delivery_orders: { product: :image }).where(user_id: @current_user.id)
      render json: delivery_orders,
             each_serializer: DeliveryOrders::DeliveryOrdersSerializer
    end
  end

  private

  def set_user
    @current_user = current_user
  end
end
