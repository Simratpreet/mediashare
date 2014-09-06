class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include PublicActivity::StoreController
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
	devise_parameter_sanitizer.for(:sign_up) << :last_name    
  end

  def after_sign_in_path_for(user)
  	user_news_feeds_path(current_user)
  end
  def after_sign_out_path_for(user)

  	new_user_session_path
  end
end
