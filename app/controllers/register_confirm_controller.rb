class RegisterConfirmController < ApplicationController
  def update
    user = User.find_by(confirm_token: params[:id])
    if user.blank?
      message = { message: 'Please get a new token!' }
    elsif user.confirm_at.present?
      message = { message: 'You have already actived!' }
    elsif (user.confirm_token.eql? user[:confirm_token]) &&
          (user.confirm_send_at + 3.days > Time.now)
      user.skip_password_validation = true
      user.update(confirm_at: Time.now)
      message = { message: 'You actived successfully!' }
    else
      message = { message: 'Please get a new token!' }
    end
    render json: message
  end
end
