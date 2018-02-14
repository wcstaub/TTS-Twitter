class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Since we don't have a User controller, we're adding things to the legal param list here
  # the first symbols is the view in which the attribute value would come from 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :bio, :location, :avatar, :following])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :bio, :location, :avatar, :following])
  end
end
