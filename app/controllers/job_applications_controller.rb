class JobApplicationsController < ApplicationController
  load_and_authorize_resource
  before_action :set_job_application, only: [ :show, :reject_job_application,
                                              :accept_job_application ]

  def index
    @job_applications = JobApplication.order(:id).page(params[:page]).per(4)
    render json: @job_applications, status: 200
  end

  def show
    if @job_application
      render_job_application_serializer(@job_application)
    else
      render json: @job_application.errors.full_messages, status: 404
    end
  end

  def applied_job_application
    render json: current_user.user_profile.job_applications, status: 200
  end

  def accept_job_application
    @job_application.status = 1
    if @job_application.save
      render_job_application_serializer(@job_application)
    else
      render json: @job_application.errors.full_messages, status: 422
    end
  end
  
  def reject_job_application
    @job_application.status = 2
    if @job_application.save
      render_job_application_serializer(@job_application)
    else
      render json: @job_application.errors.full_messages, status: 422
    end
  end

  def view_approved_job_application
    render json: JobApplication.where(status: 'accepted'), status: 200
  end
  
  def view_rejected_job_application
    render json: JobApplication.where(status: 'rejected'), status: 200
  end

  private

  def render_job_application_serializer(job_application)
    render json: JobApplicationSerializer.new(job_application).serializable_hash[:data][:attributes],
    status: 200
  end

  def set_job_application
    @job_application = JobApplication.find(params[:id])
  end

end
