class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      if user.update_columns(auth_token: SecureRandom.hex(10))
        render json: user, serializer: Sessions::SessionsSerializer, adapter: :json, root: 'user'
      end
    else
      error = { error: { message: 'Invalid email or password!' } }
      render json: error, status: 400
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if !user
      error = { error: { message: 'User not found', status: 404 } }
      render json: error
    elsif login?
      if user.update_columns(auth_token: nil)
        logout
        render json: { message: 'Logout sucessfully' }
      else
        error = { error: { message: 'Please come back later!' } }
        render json: error, status: 500
      end
    else
      error = { error: { message: 'Please login' } }
      render json: error, status: 401
    end
  end
end
