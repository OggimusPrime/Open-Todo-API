class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  attr_reader :current_user

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
    authenticate_or_request_with_http_basic do |username, password| 
      @current_user = User.where( username: username, password: password).first 
      @current_user.present? 
    end
  end
end
