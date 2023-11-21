FactoryBot.define do
  factory :user_profile do
    title { Faker::Name.name }
    designation { Faker::Name.name }
    experience { "3yrs+" }
    qualification { 'Masters in Computer applications 86%, Bachelors in Computer Application 75%, XII 80%' }
    skill_set { Faker::Lorem.unique :string }
    location { Faker::Travel::TrainStation.name(region: 'spain') }
  end
end
# :qualification, :skill_set, presence: true, length: { in: 10..300 }
# :title, :designation, :location, :experience, presence: true, length: { in: 4..30 }