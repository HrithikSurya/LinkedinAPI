class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
    protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password password_confirmation ])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name password])
  end
  
  # load_and_authorize_resource
  
  rescue_from CanCan::AccessDenied do |exception|
    render json: exception
  end

end
