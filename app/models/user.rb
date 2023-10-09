class User < ApplicationRecord
  has_many :user_profiles
  # validates :email, presence: true, uniquiness: true
end
