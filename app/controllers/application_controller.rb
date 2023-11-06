class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  include ExceptionHandling
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password password_confirmation ])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name password])
  end

end
