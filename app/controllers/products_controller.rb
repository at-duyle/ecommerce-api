class ProductsController < ApplicationController
  before_action :set_user, only: %i[check_permission]

  def index
    products = Product.includes(:images).where(available: true)
    render json: products, each_serializer: Products::ProductsSerializer
  end

  def show
    product = Product.friendly.includes(comments: :user).find(params[:id])
    render json: product, serializer: Products::ShowProductSerializer
  rescue
    error = { errors: 'Data not found' }
    render json: error, status: 404
  end

  def check_quantity
    product = Product.friendly.find(params[:id])
    product.message = if product.quantity.eql? 0
                        "#{product.name} are out of stock"
                      elsif product.quantity < params[:quantity].to_i
                        "#{product.name} have only #{product.quantity} product(s)"
                      else
                        'Available'
                      end
    render json: product, serializer: Products::ProductCartSerializer
  end

  def check_permission
    if @current_user.blank?
      error = { errors: 'Please login!' }
      render json: error, status: 401
    else
      product = Product.friendly.find(params[:id])
      order = DeliveryOrder.joins(:products_delivery_orders)
                           .where('delivery_orders.user_id = ? and products_delivery_orders.product_id = ?',
                                  @current_user.id, product.id)
      message = order.empty? ? { message: 'Let buy it to review' } : { message: 'ok' }
      render json: message
    end
  end

  def set_user
    @current_user = current_user
  end
end
