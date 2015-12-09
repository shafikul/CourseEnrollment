class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up){ |u| u.permit( :fullname, :nickname, :email, :password, :password_confirmation, :image_url, :remember_me)}
    devise_parameter_sanitizer.for(:sign_in){|u| u.permit(:login,  :email, :password, :remember_me)}
    devise_parameter_sanitizer.for(:account_update){|u| u.permit( :fullname, :nickname, :email, :password, :password_confirmation,:image_url, :current_password)}
  end

  def is_admin? user
    user.is_admin
  end
  helper_method :is_admin?
end
