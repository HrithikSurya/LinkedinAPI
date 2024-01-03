require 'rails_helper'

RSpec.describe JobProfile, type: :model do
  let!(:user) { FactoryBot.create(:user) }

  context 'Associations with multiple models' do 

    it 'has belongs_to association with company' do 
      expect(JobProfile.reflect_on_association(:company).macro).to eq(:belongs_to)
    end 

    it 'has_many association with job_applications' do 
      expect(JobProfile.reflect_on_association(:job_applications).macro).to eq(:has_many)
    end 

    it 'has_many association with user_profiles' do 
      expect(JobProfile.reflect_on_association(:user_profiles).options[:through]).to eq(:job_applications)
    end 
  end 

  context 'validations' do 
    it 'validates the persence of title' do 
      job_profile = FactoryBot.build(:job_profile, title: nil)
      expect(job_profile).not_to be_valid
    end 

    it 'validates the length of title' do 
      job_profile = FactoryBot.build(:job_profile, title: 'asdfg')
      expect(job_profile).not_to be_valid
      expect(job_profile.errors[:title]).to include('is too short (minimum is 6 characters)')
    end 


    it 'validates the persence of requirement' do 
      job_profile = FactoryBot.build(:job_profile, requirement: nil)
      expect(job_profile).not_to be_valid
    end

    it 'validates the length of requirement' do 
      job_profile = FactoryBot.build(:job_profile, requirement: 'asdfg')
      expect(job_profile).not_to be_valid
      expect(job_profile.errors[:requirement]).to include('is too short (minimum is 6 characters)')
    end 

    
    it 'validates the persence of job_description' do 
      job_profile = FactoryBot.build(:job_profile, job_description: nil)
      expect(job_profile).not_to be_valid
    end 

    it 'validates the length of job_description' do 
      job_profile = FactoryBot.build(:job_profile, job_description: 'asdfg')
      expect(job_profile).not_to be_valid
      expect(job_profile.errors[:job_description]).to include('is too short (minimum is 50 characters)')
    end 

    it 'validates the persence of no_of_openings' do 
      job_profile = FactoryBot.build(:job_profile, no_of_openings: 111111111111, company_id: 127)
      expect(job_profile).not_to be_valid
    end     

    it 'validates the presence of skills_required' do 
      job_profile = FactoryBot.build(:job_profile, skills_required: nil)
      expect(job_profile).not_to be_valid
    end 
    
    
    it 'validates the length of skills_required' do 
      job_profile = FactoryBot.build(:job_profile, skills_required: 'asdfg')
      expect(job_profile).not_to be_valid
      expect(job_profile.errors[:skills_required]).to include('is too short (minimum is 10 characters)')
    end 

  end 
end
