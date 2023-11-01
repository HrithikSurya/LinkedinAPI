class JobProfile < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :user_profiles
end
