class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if user.update_columns(auth_token: SecureRandom.hex(10))
        render json: user, serializer: Sessions::SessionsSerializer, adapter: :json, root: 'user'
      else
        error = { error: { message: 'Please come back later!', status: 500 } }
        render json: error
      end
    else
      error = { error: { message: 'Invalid email or password!', status: 400 } }
      render json: error
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
        error = { error: { message: 'Please come back later!', status: 500 } }
        render json: error
      end
    else
      render json: { message: 'Please login' }
    end
  end
end
