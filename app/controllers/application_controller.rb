# ApplicationController
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:full_name, :email, :password)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:full_name, :email, :password, :current_password,
               :is_female, :date_of_birth, :avatar, :cover_photo)
    end
  end
end
