class ResetPasswordMailer < ApplicationMailer
  def reset_password_email(user)
    @user = user
    @url = 'http://0.0.0.0:4200/reset_password'
    mail(to: @user.email, subject: 'SuperShop - Reset password of your account')
  end
end
