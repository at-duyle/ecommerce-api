class RegisterMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = 'http://0.0.0.0:4200/login'
    mail(to: @user.email, subject: 'Welcome to Super Shop')
  end
end
