require 'rails_helper'

RSpec.describe "JobProfiles", type: :request do

  include_context "shared_authenticated_job_recruiter_user"
  
  let!(:company) {  company = create(:company, user_id: user.id) }

  describe "GET /job_profiles" do
    it "list all the job profiles" do
      get '/job_profiles'
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(response.body.split(' ').length).to be > 0
    end
  end

  describe "GET /job_profiles/:id" do
    it "lists specific job profile" do
      random_integer = rand(1..10)
      get "/job_profiles/#{random_integer}"
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(response.body.split(' ').length).to be > 0
    end
  end

  describe 'POST /job_profiles' do
    it 'creates a new job profile' do
      job_profile_params = attributes_for(:job_profile, company_id: company.id)
      post '/job_profiles', params: { job_profile: job_profile_params }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['title']).to eq(job_profile_params[:title])
    end
  end

  describe 'PATCH /job_profiles/:id' do
    it 'should update job_profile' do
      job_profile = create(:job_profile, company_id: company.id)
      patch "/job_profiles/#{job_profile.id}", params: { job_profile: { title: 'Updated Name' } }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['title']).to eq('Updated Name')
    end
  end

  describe 'DELETE /job_profiles/:id' do
    it 'should delete a job_profile' do      
      job_profile = create(:job_profile, company_id: company.id)
      expect {
        delete "/job_profiles/#{job_profile.id}"
      }.to change(JobProfile, :count).by(-1)
      expect(response).to have_http_status(200)
    end
  end
end
