class ResetPasswordMailer < ApplicationMailer
  def reset_password_email(user)
    @user = user
    @url = "http://127.0.0.1:4200/reset/#{@user.reset_token}"
    mail(to: @user.email, subject: 'SuperShop - Reset password of your account')
  end
end
