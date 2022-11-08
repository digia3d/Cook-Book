class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :email, :password, :password_confirmation)
    end
  end

  # # Catch all CanCan errors and alert the user of the exception
  def after_sign_out_path_for(_resource_or_scope)
    '/users/sign_in'
  end
end
