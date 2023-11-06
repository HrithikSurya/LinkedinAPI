class JobProfile < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :user_profiles

  validates :title, :requirement, length: { in: 6..30 }, presence: true
  validates :job_description, length: { in: 50..500 }, presence: true
  validates :no_of_openings, :company_id, length: { in: 1..10 }, presence: true
  validates :skills_required, presence: true, length: { in: 10..50 }
  
end
