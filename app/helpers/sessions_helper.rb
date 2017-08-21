module SessionsHelper
  def login?
    return false if @current_user.blank?
    true
  end

  def current_user
    @current_user = nil
    return @current_user if request.headers['HTTP_AUTH_TOKEN'].nil?
    @current_user = User.find_by(auth_token: request.headers['HTTP_AUTH_TOKEN'])
  end

  def logout
    @current_user = nil
  end
end
