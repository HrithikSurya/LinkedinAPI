# frozen_string_literals :true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  
  # private
  debbugger
  
  def respond_with(resource, options={})
  if resource.persisted?
   render json: { message: 'Sign Up Successfully',data: resource }, status: :ok
  else
    # render json: { status: { message:'User Couldnot be created',errors: resource.errors.full_messages },
    # status: :unprocessable_entity }
    render json: { message:"user could not be created", status: :unprocessable_entity }
  end
  end
end
