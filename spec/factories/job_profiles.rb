FactoryBot.define do
  factory :job_profile do
    title { Faker::Name.name }
    job_description { Faker::Lorem.paragraph }
    no_of_openings { 888888 }
    requirement { "fresher, experience" }
    skills_required { Faker::Lorem.unique :string }
  end
end
