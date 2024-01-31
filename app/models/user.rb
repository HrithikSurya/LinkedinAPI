class User < ApplicationRecord
  has_one :user_profile, dependent: :destroy          #specs done
  has_one :company                                    #specs done
  
  enum role: %i[ job_seeker job_recruiter ]           #specs done

  validates :name, :role, presence: true              #specs done
  validates :email, presence: true, uniqueness: true  #specs done
  
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, 
        #  :confirmable, 
         :rememberable, :recoverable, :validatable, 
        #  :lockable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_payload
    super
  end

  def self.ransackable_attributes(auth_object = nil)
    ['name', 'email', 'role']
  end

  def self.ransackable_associations(_auth_object = nil)
    # Define the associations you want to allow for searching and sorting
    ['name', 'email', 'role']
  end

end
