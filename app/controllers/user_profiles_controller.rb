class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:create, :show, :update, :destroy]

  def index
    @user_profile = current_user.user_profile
    render json: @user_profile, status: 200
  end

  def show
    if @user_profile.present? #test with different users, check permissions that we need to assign the current user or not
      render json: @user_profile ,status: 200
    else
      render json: { error: 'User profile does not present', status: :unprocessable_entity }
    end
  end

  def create
    @user_profile = UserProfile.new(user_profile_params)
    @user_profile.user_id = current_user.id #user_id must be present otherwise it will give error ("User must Exists")
    if @user_profile.save
      render json: @user_profile ,status: 200
    else
      render json: { error: 'User profile does not Created', status: :unprocessable_entity }
    end
  end

  def update
    if @user_profile.present?
      render json: message: 'user profile is updated', status: :ok
    else
      render json: error: 'User profile does not present', status: 403
    end
  end

  def destroy
    if @user_profile.present?
      render json: @user_profile, status: :ok
      @user_profile.destroy
    else
      render json: error: 'User does not present', status: 403
    end
  end
  
  private
  def user_profile_params
    params.require(:user_profile).permit(:title, :designation, :experience, :qualification, :skill_set, :location)
  end
 
  def set_user_profile
    @user_profile = UserProfile.find[params[:id]]
  end
end
