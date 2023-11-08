class UserProfile < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :job_profiles

  validates :title, :designation, :location, :experience, presence: true, length: { in: 4..30 }
  validates :qualification, :skill_set, presence: true, length: { in: 10..300 }
end
