class Company < ApplicationRecord
  has_many :job_profiles, dependent: :destroy
end
