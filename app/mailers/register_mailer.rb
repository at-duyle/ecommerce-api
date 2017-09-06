class RegisterMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = "http://127.0.0.1:4200/register/accept/#{@user.id}/#{@user.confirm_token}"
    mail(to: @user.email, subject: 'Welcome to Super Shop')
  end
end
