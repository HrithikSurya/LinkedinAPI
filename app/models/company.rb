class Company < ApplicationRecord
  has_many :job_profiles, dependent: :destroy #specs done
  belongs_to :user                            #specs done
  
  validates :company_name, length: { minimum: 2, maximum: 100}, presence: true, uniqueness: true #specs done
  validates :sector, :location, :establishment, length: {in: 2..100 }, presence: true #specs done

  def self.ransackable_attributes(auth_object = nil)
    ['company_name', 'sector', 'location', 'establishment']
  end

  def self.ransackable_associations(_auth_object = nil)
    # Define the associations you want to allow for searching and sorting
    ['company_name', 'sector', 'location', 'establishment']
  end

end
