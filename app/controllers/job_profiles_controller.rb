class JobProfilesController < ApplicationController
  load_and_authorize_resource
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
    if @job_profile
      render json: @job_profile, status: :ok      
    else
      render json: { error: 'JobProfile Not Found', status: 422}
    end
  end

  def update #check it through route
    if @job_profile
      if @job_profile.changed?
        if @job_profile.save
          render json: 'Job profile is updated', status: 200
        else
          render json: @job_profile.errors, status: 422 #422unprocessable_entity
        end
      else
        render json: 'No changes in Job profile', status: 200
      end
    else
      render json: 'Job profile does not exist', status: 404
    end
  end

  def destroy
    if @job_profile
      @job_profile.destroy
      render json: { message: 'JobProfile successfully deleted' }, status: :ok
    else
      render json: { error: 'JobProfile not found' }, status: 404
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