class UserProfile < ApplicationRecord
  belongs_to :user                                    #specs done
  has_many :job_applications                          #specs done
  has_many :job_profiles, through: :job_applications  #specs done

  after_destroy :log_destroy_action

  validates :title, :designation, :location, :experience, presence: true, length: { in: 4..30 } #specs done
  validates :qualification, :skill_set, presence: true, length: { in: 10..300 } #specs done

  private

  def log_destroy_action
    puts "User Profile destroyed"
  end

end
