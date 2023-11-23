class Company < ApplicationRecord
  has_many :job_profiles, dependent: :destroy #specs done
  belongs_to :user                            #specs done
  
  validates :company_name, length: { minimum: 2, maximum: 100}, presence: true, uniqueness: true
  validates :sector, :location, :establishment, length: {in: 2..100 }, presence: true 

end
