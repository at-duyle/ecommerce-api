class ConfirmOrderMailer < ApplicationMailer
  def confirm_order(*args)
    @user = args[0]
    @list_product = args[1]
    @cart_product = args[2]
    @warning = args[3]
    mail(to: @user.email, subject: 'SuperShop - Confirm Order')
  end
end
