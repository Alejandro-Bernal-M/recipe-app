class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :public_recipes_path
  before_action :update_allowed_parameters, if: :devise_controller?

  def set_user
    @current_user = current_user
    redirect_to new_user_session_path unless @current_user
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
