class CartsController < ApplicationController
  before_action :set_user, only: %i[show create update password]
  def create
    if @current_user
      Cart.update_or_create_by({ user_id: @current_user.id }, cart_param)
      render json: { message: 'Save successful!' }
    else
      render json: { errors: 'User not found!' }, status: 401
    end
  rescue
    render json: { errors: 'Save unsuccessful!' }, status: 501
  end

  private

  def cart_param
    params.permit(:cart)
  end

  def set_user
    @current_user = current_user
  end
end
