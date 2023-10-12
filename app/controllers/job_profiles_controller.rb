class JobProfilesController < ApplicationController
  before_action :set_job_profile, only: [:show, :update, :destroy]
  
  def index
    @job_profiles = JobProfile.all
    render json: @job_profiles, status: :ok
  end
  
  def create
    @job_profile = JobProfile.new(job_profile_params)
    if @job_profile.save
      render json: @job_profile, status: :created
    else
      render json: { error: 'Job Profile could not be created',status: :unprocessable_entity }
    end
  end

  def show
    if @job_profile.present?
      render json: @job_profile, status: :ok      
    else
      render json: { error: 'JobProfile Not Found', status: :unprocessable_entity }
    end
  end

  def update
    if @job_profile.present?
      render json: @job_profile, status: :ok
    else
      render json: { error: 'Job Profile could not be updated', status: :unprocessable_entity }
    end
  end

  def destroy
    if @job_profile.present?
      render json: @job_profile, status: :ok
      @job_profile.destroy
    else
      render json: { error: ' JobProfile Not Found' }, status: 403
    end
  end

  private

  def set_job_profile
    @job_profile = JobProfile.find(params[:id])
  end

  def job_profile_params
    params.require(:job_profile).permit(:title, :job_description, :no_of_openings, :requirement, :skills_required)
  end
end