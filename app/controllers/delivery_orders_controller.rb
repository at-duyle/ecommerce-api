class DeliveryOrdersController < ApplicationController
  before_action :set_user, only: %i[index create]

  def index
    if @current_user.blank?
      error = { errors: 'Please login!' }
      render json: error, status: 401
    else
      delivery_orders = DeliveryOrder.includes(products_delivery_orders: { product: :image }).where(user_id: @current_user.id)
      render json: delivery_orders, each_serializer: DeliveryOrders::DeliveryOrdersSerializer
    end
  end

  def create
    products = deliver_order_params[:products]
    list_products = []
    shop_ids = []
    order_ids = []
    total_orders = []
    warning = []
    ActiveRecord::Base.transaction do
      products.each_with_index do |product, index|
        product_temp = Product.friendly.find(product[:slug])
        if product[:quantity].to_i > product_temp.quantity.to_i
          warning.push(product_temp)
          products.delete(index)
        else
          list_products.push(product_temp)
          shop_id = shop_ids.find_index(product_temp.shop_id)
          if shop_id.nil?
            shop_ids.push(product_temp.shop_id)
            order = DeliveryOrder.create(user_id: @current_user.id)
            order_ids.push(order.id)
            total = product_temp.price.to_f * product[:quantity].to_f
            total_orders.push(total)
            ProductsDeliveryOrder.create!(product_id: product_temp.id, delivery_order_id: order.id,
                                          quantity: product[:quantity])
          else
            total = product_temp.price.to_f * product[:quantity].to_f
            total_orders[shop_id] += total
            ProductsDeliveryOrder.create!(product_id: product_temp.id, delivery_order_id: order_ids[shop_id],
                                          quantity: product[:quantity])
          end
          quantity_remain = product_temp.quantity.to_i - product[:quantity].to_i
          product_temp.update(quantity: quantity_remain)
          next unless index == products.size - 1
          order_ids.each_with_index do |e, id|
            DeliveryOrder.update(e, total_price: total_orders[id])
          end
        end
      end
      ConfirmOrderMailer.confirm_order(@current_user, list_products, products.to_json, warning).deliver_later
      render json: { message: 'Please check your email to comfirm your order.', warning: warning }
    end
  rescue StandardError => e
    render json: { errors: e.message }, status: 500
  end

  private

  def deliver_order_params
    params.require(:cart).permit(products: %i[slug quantity])
  end

  def set_user
    @current_user = current_user
  end
end
