require 'rails_helper'
  
RSpec.describe "Companies", type: :request do
  
  include_context "shared_authenticated_job_recruiter_user"

  describe "GET /companies" do
    it "lists all the companies" do		      
      get "/companies"
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(response.body.split(' ').length).to be > 0
    end
  end

  describe "GET /companies/:id" do
    it "lists a specific company" do
      random_integer = rand(1..10)
      get "/companies/#{random_integer}"
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(response.body.split(' ').length).to be > 0
    end
  end

  describe 'POST /companies' do
    it 'creates a new company' do
      company_params = attributes_for(:company, user_id: user.id)
      post '/companies', params: { company: company_params }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['company_name']).to eq(company_params[:company_name])
    end
  end

  describe 'PATCH /companies/:id' do
    it 'should update company' do
      company = create(:company, user_id: user.id)
      patch "/companies/#{company.id}", params: { company: { company_name: 'Updated Name' } }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['company_name']).to eq('Updated Name')
    end
  end

  describe 'DELETE /companies/:id' do
    it 'should delete a company' do
      company = create(:company, user_id: user.id)
      expect {
        delete "/companies/#{company.id}"
      }.to change(Company, :count).by(-1)

      expect(response).to have_http_status(200)
    end
  end
end
