class User < ApplicationRecord
  has_one :user_profile, dependent: :destroy
  # validates :email, presence: true, uniquiness: true
  enum role: %i[admin job_seeker job_recruiter]
  
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, 
         :rememberable, :recoverable, :validatable, 
         :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_payload
    super
  end
end
