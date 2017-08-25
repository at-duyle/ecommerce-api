class UsersController < ApplicationController
  before_action :set_user, only: %i[index update password]

  def index
    if @current_user
      render json: @current_user, serializer: Users::CurrentUserSerializer
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

  def update
    if @current_user
      @current_user.skip_password_validation = true
      if @current_user.update(update_params)
        render json: current_user, serializer: Users::CurrentUserSerializer
      else
        errors = { errors: @current_user.errors.full_messages }
        render json: errors, status: 401
      end
    else
      render json: { errors: 'User not found!' }, status: 401
    end
  end

  def password
    if @current_user
      if @current_user.update(password: params[:user][:password],
                              password_confirmation: params[:user][:password_confirmation])
        render json: { message: 'Update password successfully!' }
      else
        errors = { errors: @current_user.errors.full_messages }
        render json: errors, status: 401
      end
    else
      render json: { errors: 'User not found!' }, status: 401
    end
  end

  private

  def register_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

  def update_params
    params.require(:user).permit(:name, :email, :username, :gender, :avatar)
  end

  def set_user
    @current_user = current_user
  end
end
