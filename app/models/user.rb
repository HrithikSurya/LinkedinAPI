class User < ApplicationRecord
  has_one :user_profile, dependent: :destroy

  enum role: %i[ job_seeker job_recruiter]
  
  # validates :name, presence: true, length: { in: 2..50 }

  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, 
         :rememberable, :recoverable, :validatable, 
         :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_payload
    super
  end
end
