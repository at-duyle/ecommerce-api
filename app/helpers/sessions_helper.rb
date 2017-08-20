module SessionsHelper
  def login?
    unless request.headers['HTTP_AUTH_TOKEN'].nil?
      @current_user = User.find_by(auth_token: request.headers['HTTP_AUTH_TOKEN'])
    end
    return false if @current_user.blank?
    true
  end

  def logout
    @current_user = nil
  end
end
