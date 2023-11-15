require 'rails_helper'

RSpec.describe "JobApplications", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/job_applications/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/job_applications/show"
      expect(response).to have_http_status(:success)
    end
  end

end
