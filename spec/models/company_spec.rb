require 'rails_helper'

RSpec.describe Company, type: :model do
  context "Associations of Company" do
    it 'Belongs_to Association with User' do
      expect(Company.reflect_on_association(:user).macro).to eq(:belongs_to) 
    end

    it "has_many assocation with Job_Profiles" do
      expect(Company.reflect_on_association(:job_profiles).macro).to eq(:has_many)
    end

    it "has_many association with Job Profile with dependent destroy options" do
      expect(Company.reflect_on_association(:job_profiles).options[:dependent]).to eq(:destroy)
    end
  end

  context "Validation when Creating a Company" do
    user = FactoryBot.create(:user, role: 1)

    it "valid with all attributes" do
      company = FactoryBot.create(:company, user_id: user.id)
      expect(company).to be_valid
    end

    it "validates the presence of company name" do
      company = FactoryBot.build(:company, company_name: nil, user_id: user.id)
      expect(company).not_to be_valid
    end

    it "validates the uniqueness of company name" do
      company = FactoryBot.build(:company, user_id: user.id)
      dup_company = FactoryBot.build(:company, user_id: user.id)
      expect(company.company_name).not_to eq(dup_company.company_name)
    end

    it "validates the length of company name" do
      company = FactoryBot.build(:company, company_name: 'a', user_id: user.id)
      company.save
      expect(company.errors[:company_name]).to include('is too short (minimum is 2 characters)')
    end

    it "validates the presence of sector of a company" do
      company = FactoryBot.build(:company, sector: nil, user_id: user.id)
      expect(company).not_to be_valid  
    end
    
    it "validates the length of sector of a company" do
      company = FactoryBot.build(:company, sector: 'n', user_id: user.id)
      company.save
      expect(company.errors[:sector]).to include('is too short (minimum is 2 characters)')
    end
    
    it "validates the presence of location of company" do
      company = FactoryBot.build(:company, location: nil, user_id: user.id)
      expect(company).not_to be_valid
    end

    it "validates the length of location" do
      company = FactoryBot.build(:company, location: 'a', user_id: user.id)
      company.save
      expect(company.errors[:location]).to include("is too short (minimum is 2 characters)")  
    end

    it "validates the presence of establishment of a company" do
      company = FactoryBot.build(:company, establishment: nil, user_id: user.id)
      expect(company).not_to be_valid
    end
    
    it "validates the length of a establishment of a company" do
      company = FactoryBot.build(:company, establishment: 'a', user_id: user.id)
      company.save
      expect(company.errors[:establishment]).to include("is too short (minimum is 2 characters)") 
    end
  end
end
