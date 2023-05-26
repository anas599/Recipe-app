class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email name password password_confirmation])
  end

  # def set_current_user
  #   @current_user = current_user
  # end

  def after_sign_in_path_for(resource)
    flash[:notice] = "Welcome back, #{resource.name}!"
    super
  end
end
