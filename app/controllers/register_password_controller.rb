class RegisterPasswordController < ApplicationController
  def update
    user = User.find_by(confirm_token: params[:id])
    binding.pry
    if user.blank?
      message = { message: 'Please get a new token!' }
      render json: message
    elsif user.confirm_at.present?
      message = { message: 'You have already actived!' }
      render json: message
    else
      if (user.confirm_token.eql? user[:confirm_token]) &&
         (user.confirm_send_at + 3.days > Time.now)
         user.skip_password_validation = true
          user.update(confirm_at: Time.now)
          message = { message: 'You actived successfully!' }
          render json: message
      else
        message = { message: 'Please get a new token!'}
        render json: message
      end
    end
  end
end
