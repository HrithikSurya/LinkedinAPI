require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  context "when creating  a new UserProfile" do
    
    it "is valid with all valid attributes" do
      user_profile = FactoryBot.create(:user_profile)
      expect(user_profile).to be_valid
    end


  end
end
