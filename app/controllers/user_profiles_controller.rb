class UserProfilesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_user_profile, only: [:show, :update, :destroy]

  def index
    @user_profiles = UserProfile.all
    render json: @user_profiles, status: 200
  end

  def show
    if @user_profile
      render json: @user_profile , status: 200
    else
      render json: 'User profile not found', status: 404
    end
  end

  def create
    @user_profile = UserProfile.new(user_profile_params)
    @user_profile.user_id = current_user.id 

    if @user_profile.save
      render json: @user_profile, status: 200
    else
      render json: @user_profile.errors.full_messages, status: 422
    end
  end

  def update
    if @user_profile
      if @user_profile.update(user_profile_params)
        render json: @user_profile, status: 200
      else
        render json: @user_profile.errors, status: 422
      end
    else
      render json: 'User profile Not found', status: 404
    end
  end
  
  def destroy
    if @user_profile
      if @user_profile.destroy
        render json: 'Profile Deleted Successfully', status: 200
      else
        render json: @job_profile.errors.full_messages, status: 422
      end
    else
      render json: 'User profile not found', status: 404
    end
  end
  
  private

  def user_profile_params
    params.require(:user_profile).permit(:title, :designation, :experience, :qualification, :skill_set, :location)
  end
 
  def set_user_profile
    @user_profile = UserProfile.find(params[:id])
  end

end
