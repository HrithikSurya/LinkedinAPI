class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  include RackSessionsFix

  respond_to :json

  def destroy
    resource.destroy ? (render json: "User registration deleted successfully") :
    (render_with_flash(:unprocessable_entity, "Failed to delete user registration"))
  end

  private

  def respond_with(current_user, _opts = {})
    if resource.persisted?
      UserMailer.with(user: current_user).welcome_email.deliver_later
      render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes],
      status: 200
    else
      render json: {
      message:  {status: "User couldn't be created successfully. #{current_user.errors.full_messages.to_sentence}"}
      }, status: 422
    end
  end

  protected 
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :name, :role])
  end
   
end
