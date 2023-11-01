class JobProfilesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_job_profile, only: [:show, :update, :destroy]

  def index
      @job_profiles = JobProfile.all
      render json: @job_profiles, status: 200
  end
  
  def create
    @job_profile = JobProfile.new(job_profile_params)
    if @job_profile.save
      render json: @job_profile, status: 200
    else
      render json: @job_profile.errors.full_messages, status: 422
    end
  end

  def show
    if @job_profile
      render json: @job_profile, status: 200      
    else
      render json: 'JobProfile Not Found', status: 404
    end
  end

  def update
    if @job_profile
      if @job_profile.update(job_profile_params)
        render json: @job_profile, status: 200
      else
        render json: @job_profile.errors.full_messages, status: 422 #422unprocessable_entity
      end
    else
      render json: 'Job profile not found', status: 404
    end
  end

  def destroy
    if @job_profile
      if @job_profile.destroy
        render json: 'JobProfile deleted successfully', status: 200
      else
        render json: @job_profile.errors.full_messages, status: 422
      end
    else
      render json: 'JobProfile not found', status: 404
    end
  end

  private
  
  def set_job_profile
    @job_profile = JobProfile.find(params[:id])
  end

  def job_profile_params
    params.require(:job_profile).permit(:title, :job_description, :no_of_openings, :requirement, :skills_required, :company_id)
  end
end