class RequestsController < ApplicationController
  def create
    admin = Admin.find_by(email: request_params[:email])
    shop = Shop.find_by(name: request_params[:shop_name])
    if admin.nil?
      if shop.nil?
        request = Request.create(request_params)
        if request.errors.blank?
          message = { message: 'Thanks for your registration! You will recieve an email about your shop. Pease wait for 48 hours!' }
          render json: message
        else
          errors = { errors: request.errors.full_messages }
          render json: errors, status: 401
        end
      else
        errors = { errors: 'Shop is existed!' }
        render json: errors, status: 401
      end
    else
      errors = { errors: 'Admin is existed!' }
      render json: errors, status: 401
    end
  end

  private

  def request_params
    params.require(:request).permit(:name, :email, :phone_number, :shop_name, :latitude, :longitude,
                                    :shop_address)
  end
end
