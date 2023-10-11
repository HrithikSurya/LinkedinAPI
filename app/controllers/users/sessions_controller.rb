# frozen_string_literal :true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private
 
  def respond_with(resource, options={})
      # debugger
  if resource.persisted?
   render json: {
     status: { code: 200, message: 'Sign Up Successfully', data: current_user }
   }, status: :ok
  end
 end

 def respond_to_on_destroy
  jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first 
  current_user = User.find(jwt_payload['sub'])
  # debugger
  if current_user
    render json: {
      status: 200,
      message: "Signed Out Successfully" }, status: :ok
  else
    render json: {
      status: 401,
      message: "User has NO Active Session"
    }, status: :unauthorized
  end
 end
end
