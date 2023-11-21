require 'rails_helper'

RSpec.describe User, type: :model do

  context 'when creating a user' do 
    # let(:user) { FactoryBot.create(:user, email:'user1@gmail.com') }

    it 'is valid with all valid attributes' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it 'is invalid without name' do
      user = FactoryBot.build(:user, name: nil)
      expect(user).to_not be_valid
    end

    it 'is invalid without a role' do
      user = FactoryBot.build(:user, role: nil)
      expect(user).to_not be_valid
    end

    it 'is invalid without an email' do
      user = FactoryBot.build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it 'has a valid enum role' do
      user = FactoryBot.build(:user)
      # debugger
      expect(user).to_not be_valid
    end

    it 'destroys associated user profile on destroy' do
      user = FactoryBot.create(:user) #should be created, user contains userid
      user_profile = FactoryBot.build(:user_profile, user_id: user.id)
      user_profile.save

      expect { user.destroy }.to change(UserProfile, :count).by(-1)
    end

    it 'should raise RecordInvalid for duplicate emails' do
      user = FactoryBot.create(:user, email: 'duplicate@gmail.com') #should be created
      user2 = FactoryBot.build(:user, email: 'duplicate@gmail.com') # instantiate it and then save
      puts "\n\nUser email: #{user.email}"
      puts "User2 email: #{user2.email}"
      user2.save

      expect(user2.errors[:email]).to include("has already been taken") # works both
      expect(user2).to_not be_valid # works both
    end
     
  end
end