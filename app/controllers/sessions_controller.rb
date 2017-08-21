class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      if user.update_columns(auth_token: SecureRandom.hex(10))
        render json: user, serializer: Sessions::SessionsSerializer, adapter: :json, root: 'user'
      end
    else
      error = { errors: 'Invalid email or password!' }
      render json: error, status: 400
    end
  end

  def destroy
    user = User.find_by(auth_token: params[:auth_token])
    if !user
      error = { errors: 'User not found!' }
      render json: error, status: 404
    elsif login?
      if user.update_columns(auth_token: nil)
        logout
        render json: { message: 'Logout sucessfully!' }
      end
    else
      error = { errors: 'Please login!' }
      render json: error, status: 401
    end
  end
end
