FactoryBot.define do
  factory :job_application do
    status { 0 }
    job_profile_id { 3 }
    user_profile_id { 2 }
  end
end
