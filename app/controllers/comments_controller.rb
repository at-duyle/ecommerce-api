class CommentsController < ApplicationController
  before_action :set_user, only: %i[create]

  def index
    comments = Comment.where(product_id: params[:product_id])
    render json: comments, each_serializer: Comments::CommentsSerializer
  end

  def create
    if @current_user.blank?
      error = { errors: 'Please login!' }
      render json: error, status: 401
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

  def set_user
    @current_user = current_user
  end
end
