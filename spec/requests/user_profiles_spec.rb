require 'rails_helper'

RSpec.describe "UserProfiles", type: :request do
  
  include_context "shared_authenticated_job_seeker_user"
  
  describe "GET /user_profiles" do
    it "list all the user_profiles" do
      get '/user_profiles'
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to be > 0
    end
  end

  describe "GET /user_profiles/:id" do
    it "list a specific user_profiles" do
      user_profile = create(:user_profile, user_id: user.id)
      get "/user_profiles/#{user_profile.id}"
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to be > 0
    end
  end

  describe 'POST /user_profiles' do
    it 'creates a new job profile' do
      user_profile_params = attributes_for(:user_profile, user_id: user.id)
      post '/user_profiles', params: { user_profile: user_profile_params }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['title']).to eq(user_profile_params[:title])
    end
  end

  describe 'PATCH /user_profiles/:id' do
    it 'should update user_profile' do
      user_profile = create(:user_profile, user_id: user.id)
      patch "/user_profiles/#{user_profile.id}", params: { user_profile: { title: 'Updated Name' } }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['title']).to eq('Updated Name')
    end
  end

  describe 'DELETE /user_profiles/:id' do
    it 'should delete a user_profile' do      
      user_profile = create(:user_profile, user_id: user.id)
      expect {
        delete "/user_profiles/#{user_profile.id}"
      }.to change(UserProfile, :count).by(-1)
      expect(response).to have_http_status(200)
    end
  end
end
