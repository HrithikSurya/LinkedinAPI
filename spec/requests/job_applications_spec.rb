require 'rails_helper'

RSpec.describe "JobApplications", type: :request do
  let(:user) { FactoryBot.create(:user, role: "job_recruiter") }
  before do
    sign_in user
  end
  
  describe "GET /job_applications" do
    it "list all the JobApplications" do
      get "/job_applications/index"
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /job_applications/:id" do
    it "lists a specific job_application" do
      job_application = create(:job_application)
      get "/job_applications/show/#{job_application.id}"
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['id']).to eq(job_application.id)
    end
  end

  # describe 'POST /job_applications/accept_job_application/:id' do
    # it 'creates a job_application' do
  # end

end
#use your mind after seeing the routes of job_applications and studying the rspecs matchers