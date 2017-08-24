class UsersController < ApplicationController
  def index
    user = current_user
    if user
      render json: current_user, serializer: Users::CurrentUserSerializer
    else
      render json: { errors: 'User not found!' }, status: 401
    end
  end

  def create
    user = User.create(user_params)
    if user.errors.blank?
      render json: user, serializer: Users::ShowUserSerializer, adapter: :json, root: 'user'
    else
      errors = { errors: user.errors.full_messages }
      render json: errors, status: 401
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
