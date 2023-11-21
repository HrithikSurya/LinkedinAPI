class User < ApplicationRecord
  has_one :user_profile, dependent: :destroy
  has_one :company
  
  enum role: %i[ job_seeker job_recruiter ]

  validates :name, :role, presence: true
  validates :email, presence: true, uniqueness: true
  
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, 
         :rememberable, :recoverable, :validatable, 
         :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_payload
    super
  end
end
