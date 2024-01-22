class Users::SessionsController < Devise::SessionsController
  include RackSessionsFix

  respond_to :json
  
  private
  
  def respond_with(current_user, _opts = {})
    UserMailer.with(user: current_user).login_mail.deliver_later
    render json: {
      data: { 
        code: 200, message: 'Logged in successfully.',
        user: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      }
    }, status: 200
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last,
                                                Rails.application.credentials.fetch(:secret_key_base)).first
      current_user = User.find(jwt_payload['sub'])
    end
    
    if current_user
      render json: {
        status: 200,
        message: 'Logged out successfully.'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
