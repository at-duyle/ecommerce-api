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
    register_params
    user = User.create(register_params.merge(confirm_send_at: Time.now,
                                             confirm_token: SecureRandom.hex(10)))
    if user.errors.blank?
      RegisterMailer.welcome_email(user).deliver_now
      render json: user, serializer: Users::ShowUserSerializer
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
      if @current_user.authenticate(params[:user][:old_password])
        if @current_user.update(password: params[:user][:password],
                                password_confirmation: params[:user][:password_confirmation])
          render json: { message: 'Update password successfully!' }
        else
          errors = { errors: @current_user.errors.full_messages }
          render json: errors, status: 401
        end
      else
        render json: { errors: 'Incorrect current password' }, status: 401
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
    params.require(:user).permit(:name, :email, :username, :gender, :address, :description)
  end

  def set_user
    @current_user = current_user
  end
end
