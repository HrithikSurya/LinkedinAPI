class JobProfile < ApplicationRecord
  belongs_to :company
  # has_many :user_profiles, :dependent => :destroy, as: :available
  has_and_belongs_to_many :job_profiles
end
