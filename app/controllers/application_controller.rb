class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: e, status:400
  end

  rescue_from CanCan::AccessDenied do |exception|
    render json: exception
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password password_confirmation ])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name password])
  end

end
