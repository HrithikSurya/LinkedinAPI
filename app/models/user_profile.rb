class UserProfile < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :job_profiles
end
