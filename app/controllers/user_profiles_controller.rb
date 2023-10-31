class UserProfilesController < ApplicationController
  load_and_authorize_resource
  before_action :set_user_profile, only: [:show, :update, :destroy]
  # before_action :check_user_signed_in?

  def index
    # @user_profile = current_user.user_profile
    @user_profiles = UserProfile.all
    render json: @user_profiles, status: 200
  end

  def show
    if @user_profile
      render json: @user_profile , status: 200
    else
      render json: 'User profile does not present', status: :unprocessable_entity
    end
  end

  def create
    @user_profile = UserProfile.new(user_profile_params)
    @user_profile.user_id = current_user.id 

    if @user_profile.save
      render json: @user_profile ,status: 200
    else
      render json: 'User profile does not Created', status: :unprocessable_entity
    end
  end

  def update #check it
    if @user_profile
      if @user_profile.changed?
        if @user_profile.save
          render json: 'User profile is updated', status: 200
        else
          render json: @user_profile.errors, status: 422
        end
      else
        render json: 'No changes in user profile', status: 200
      end
    else
      render json: 'User profile does not exist', status: 404
    end
  end
  
  def destroy
    if @user_profile
      @user_profile.destroy
      render json: 'Profile Deleted', status: :ok
    else
      render json: 'User does not present', status: 403
    end
  end
  
  private
  def user_profile_params
    params.require(:user_profile).permit(:title, :designation, :experience, :qualification, :skill_set, :location)
  end
 
  def set_user_profile
    # debugger
    @user_profile = UserProfile.find(params[:id])
  end

  def check_user_signed_in?
    render json: 'user needs to be signed in' unless user_signed_in?
  end
end
