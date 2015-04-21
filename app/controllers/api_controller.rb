class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  # protected
  private
  
  # def authenticate
  #   authenticate_token || render_unauthorized
  # end
  
  # def authenticate_token
  #   authenticate_with_http_token do |token, options|
  #     User.find_by(auth_token: token)
  #   end
  # end

  # def render_unauthorized
  #   self.headers['WWW-Authenticate'] = 'Token realm="Users"'

  #   respond_to do |format|
  #     format.json { render json: 'Bad credentials', status: 401 }
  #   end
  # end
  def authenticated?
    authenticate_or_request_with_http_basic { |username, password| User.where( username: username, password: password).present? }
  end
end
