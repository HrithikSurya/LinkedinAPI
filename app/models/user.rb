class User < ApplicationRecord
  has_one :user_profile, dependent: :destroy
  # validates :email, presence: true, uniquiness: true
  enum :role, { admin: 0, job_seeker: 1, job_recruiter: 2 }
  
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, 
         :rememberable, :recoverable, :validatable, 
         :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_payload
    super
  end

  # roles.each do |role_name|
  #   define_method "#{role_name}?" do 
  #     role == role_name 
  #   end
  # end

  # def admin? 
  #   # debugger
  #   role.key(current_user.role) ==  "admin"  # role is coming from the user's table
  # end

  # def job_seeker?
  #   role.key(current_user.role) ==  "job_seeker"  # role is coming from the user's table
  # end

  # def job_recruiter?
  #   role.key(current_user.role) ==  "job_recruiter"  # role is coming from the user's table
  # end
  
  # private

  # def set_default_role
  #   self.role ||= :job_seeker
  # end

end
