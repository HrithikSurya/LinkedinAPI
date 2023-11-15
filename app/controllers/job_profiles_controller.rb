class JobProfilesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_job_profile, only: [:show, :update, :destroy]

  def index
    @job_profiles = JobProfile.order(:id).page(params[:page]).per(2) 
    render json: @job_profiles, status: 200
  end

  def create
    @job_profile = JobProfile.new(job_profile_params)
    @job_profile.company_id = current_user.company.id
    if @job_profile.save
      render_job_profile_serializer(@job_profile)
    else
      render json: @job_profile.errors.full_messages, status: 422
    end
  end

  def show
    if @job_profile
      render_job_profile_serializer(@job_profile)
    else
      render_not_found
    end
  end

  def update
    if @job_profile
      if @job_profile.update(job_profile_params)
        render_job_profile_serializer(@job_profile)
      else
        render json: @job_profile.errors.full_messages, status: 422 #422unprocessable_entity
      end
    else
      render_not_found
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
      render_not_found
    end
  end

  private
  
  def render_job_profile_serializer(job_profile)
    render json: JobProfileSerializer.new(job_profile).serializable_hash[:data][:attributes], status: 200    
  end

  def set_job_profile
    @job_profile = JobProfile.find(params[:id])
  end

  def render_not_found
    render json: 'Job Profile not found', status: 404
  end

  def job_profile_params
    params.require(:job_profile).permit(:title, :job_description, :no_of_openings, :requirement, :skills_required)
  end
end