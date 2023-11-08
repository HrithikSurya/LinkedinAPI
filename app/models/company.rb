class Company < ApplicationRecord
  has_many :job_profiles, dependent: :destroy
  
  validates :company_name, length: { minimum: 5, maximum: 100}, presence: true
  validates :sector, :location, :establishment, length: {in: 2..100 }, presence: true 

end
