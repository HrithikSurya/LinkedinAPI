class UserProfile < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :job_profiles

  validates :title, :designation, :location, :experience, presence: true, length: { in: 10..30 }
  validates :qualification, :skill_set, :experience, presence: true, length: { in: 50..300 }
end
