class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_one :user_profile
  # validates :email, presence: true, uniquiness: true
  
  def jwt_payload
    super
  end

  ROLES = %w{ admin job_seeker job_recruiter }
  # array of strings {"admin", "job_seeker", "job_recruiter}

  # ROLES.each do |role_name|
  #   define_method "#{role_name}?" do 
  #     role == role_name 
  #   end
  # end

  def admin?
    # debugger
    role == "admin" # role is coming from the user's table
  end

  def job_seeker?
    role == "job_seeker"
  end

  def job_recruiter?
    role == "job_recruiter"
  end

end
