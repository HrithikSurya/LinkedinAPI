class UserProfile < ApplicationRecord
  belongs_to :user
  has_many :job_applications
  has_many :job_profiles, through: :job_applications


  validates :title, :designation, :location, :experience, presence: true, length: { in: 4..30 }
  validates :qualification, :skill_set, presence: true, length: { in: 10..300 }
end
