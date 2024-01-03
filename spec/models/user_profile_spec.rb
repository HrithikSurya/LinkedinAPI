require 'rails_helper'

RSpec.describe UserProfile, type: :model do

  let!(:user) { FactoryBot.create(:user) }
  
  context "is valid when creating a UserProfile" do

    it "is valid with all valid attributes" do
      user_profile = FactoryBot.build(:user_profile, user_id: user.id)
      expect(user_profile).to be_valid
    end

    it 'is invalid without qualification' do
      user_profile = FactoryBot.build(:user_profile, qualification: nil, user_id: user.id)
      expect(user_profile).not_to be_valid
    end
    
    it 'is invalid without skill_set' do
      user_profile = FactoryBot.build(:user_profile, skill_set: nil, user_id: user.id)
      expect(user_profile).not_to be_valid
    end

    it 'is invalid without title' do
      user_profile = FactoryBot.build(:user_profile, title: nil, user_id: user.id)
      expect(user_profile).not_to be_valid
    end
    
    it 'is invalid without designation' do
      user_profile = FactoryBot.build(:user_profile, designation: nil, user_id: user.id)
      expect(user_profile).not_to be_valid
    end

    it 'is invalid without location' do
      user_profile = FactoryBot.build(:user_profile, location: nil, user_id: user.id)
      expect(user_profile).not_to be_valid
    end

    it 'is invalid without experience' do
      user_profile = FactoryBot.build(:user_profile, experience: nil)
      expect(user_profile).not_to be_valid
    end
  end 

  context 'Association of User_Profile' do

    it 'has belongs_to association with user' do 
      expect(UserProfile.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'has_many association with job_applications' do 
      expect(UserProfile.reflect_on_association(:job_applications).macro).to eq(:has_many)
    end

    it 'has_many association with job_profiles' do 
      expect(UserProfile.reflect_on_association(:job_profiles).options[:through]).to eq(:job_applications)
    end 

  end 
end
