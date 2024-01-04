require 'rails_helper'

RSpec.describe "JobProfiles", type: :request do

  include_context "shared_authenticated_job_recruiter_user"
  
  describe "GET /job profiles" do
    it "list all the job profiles" do
      get '/job_profiles'
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(response.body.split(' ').length).to be > 0
    end
  end

  describe "GET /job profiles/:id" do
    it "lists specific job profile" do
      random_integer = rand(1..10)
      get "/job_profiles/#{random_integer}"
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(response.body.split(' ').length).to be > 0
    end
  end



end
