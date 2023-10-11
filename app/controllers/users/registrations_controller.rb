# frozen_string_literals :true

class Users::RegistrationsController < Devise::RegistrationsController
 respond_to :json

 private

 def respond_with(resource, options={})
 if resource.persisted?
  render json: {
    status: { code: 200, message: 'Sign Up Successfully',data: resource }, status: :ok
  }
else
  render json: { status: { message:'User Couldnot be created',errors: resource.errors.full_messages }, status: :unprocessable_entity }
 end
 end
end
