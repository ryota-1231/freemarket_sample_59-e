class ApplicationController < ActionController::Base
  # before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '1111'
    end
  end
end