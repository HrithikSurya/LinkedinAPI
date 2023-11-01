class User < ApplicationRecord
  has_one :user_profile, dependent: :destroy

  enum role: %i[admin job_seeker job_recruiter]
  # create_table "users", force: :cascade do |t|
  #   t.string "name"
  #   t.integer "role", default: 1
  
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, 
         :rememberable, :recoverable, :validatable, 
         :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_payload
    super
  end
end
