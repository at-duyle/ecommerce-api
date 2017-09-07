class CommentsController < ApplicationController
  before_action :set_user, only: %i[create]

  def create
    if @current_user.blank?
      error = { errors: 'Please login!' }
      render json: error, status: 401
    else
      product = Product.friendly.find(params[:product_id])
      order = DeliveryOrder.joins(:products_delivery_orders)
                           .where('delivery_orders.user_id = ? and products_delivery_orders.product_id = ?',
                                  @current_user.id, product.id)
      if order.empty?
        errors = { errors: 'You don\'t review this product. Because you didn\'t buy it.' }
        render json: errors, status: 401
      else
        comment = Comment.create(product_id: product.id,
                                 content: params[:comment][:content],
                                 user_id: @current_user.id)
        if comment.errors.blank?
          render json: comment, serializer: Comments::CreateCommentSerializer
        else
          errors = { errors: comment.errors.full_messages }
          render json: errors, status: 401
        end
      end
    end
  end

  def set_user
    @current_user = current_user
  end
end
