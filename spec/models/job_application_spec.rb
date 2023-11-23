require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  user = FactoryBot.create(:user)
  user_profile = FactoryBot.create(:user_profile, user_id: user.id)

  company = FactoryBot.create(:company, user_id: user.id)
  job_profile = FactoryBot.create(:job_profile, company_id: company.id)
  
  context "Validation of Job Application" do
    it 'has all valid attributes' do
      job_application = FactoryBot.build(:job_application,
                                            user_profile_id: user_profile.id,
                                            job_profile_id: job_profile.id )
      expect(job_application).to be_valid
    end

    it 'validates the presence of status' do
      job_application = FactoryBot.build(:job_application, status: nil,
                                             job_profile_id: job_profile.id,
                                             user_profile_id: user_profile.id )
      expect(job_application).not_to be_valid
    end

    it 'has a valid status' do
      job_application = FactoryBot.build(:job_application, status: 1,
                                             job_profile_id: job_profile.id,
                                             user_profile_id: user_profile.id )
      expect(job_application).to be_valid
    end
  end

  context "Association of Job_Application" do
    it 'has a belongs to association with user_profile' do
      expect(JobApplication.reflect_on_association(:user_profile).macro).to eq(:belongs_to)
    end

    it 'has a belongs to association with job_profile' do
      expect(JobApplication.reflect_on_association(:job_profile).macro).to eq(:belongs_to)
    end

  end
end
