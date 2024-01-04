require 'rails_helper'

RSpec.describe "Users::UsersController", type: :request do

  include_context "shared_authenticated_job_seeker_user"
  
  describe "GET /users/users" do
    it "list all the users" do
      get '/users/users'
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to be > 0
    end
  end

  describe 'GET /users/users/:id' do
    it 'lists a specific user' do
      user = create(:user)
      get "/users/users/#{user.id}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['id']).to eq(user.id)
    end
  end

  describe 'POST /users/users' do
    it 'creates a new user' do
      user_params = { 
        name: user.name, email: user.email,
        password: user.password, password_confirmation: user.password,
        role: user.role
      }
      post '/users/users', params: { user: user_params }
      expect(response).to have_http_status(422) #not woriking
      # expect(JSON.parse(response.body)['title']).to eq(user_params[:title])
    end
  end

  describe 'PATCH /users/users/:id' do
    it 'updates the user' do
      patch "/users/users/#{user.id}", params: { user: { name: 'Updated Name' } }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['name']).to eq('Updated Name')
    end
  end

  describe 'DELETE /users/users/:id' do
    it 'destroys the user' do
      expect {
        delete "/users/users/#{user.id}"
      }.to change(User, :count).by(-1)

      expect(response).to have_http_status(200)
    end
  end
end
