class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      if user.update_columns(auth_token: SecureRandom.hex(10))
        # render json: user, serializer: Sessions::SessionsSerializer
        render json: user
      end
    else
      error = { errors: 'Invalid email or password!' }
      render json: error, status: 400
    end
  end

  def destroy
    if login?
      if current_user.update_columns(auth_token: nil)
        logout
        render json: { message: 'Logout sucessfully!' }
      end
    else
      error = { errors: 'Please login!' }
      render json: error, status: 401
    end
  end
end
