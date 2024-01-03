FactoryBot.define do
  factory :company do
    company_name { Faker::Company.name }
    sector { Faker::Company.department }
    location {"INDIA"}
    establishment { 2001 }
  end
end
