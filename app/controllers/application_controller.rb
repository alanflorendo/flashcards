class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  http_basic_authenticate_with name: Rails.application.secrets.basic_auth[:name], password: Rails.application.secrets.basic_auth[:password]
  protect_from_forgery with: :exception
end
