class JobProfile < ApplicationRecord
  belongs_to :company                                      #specs done
  has_many :job_applications                               #specs done
  has_many :user_profiles, through: :job_applications      #specs done

  after_destroy :log_destroy_action

  validates :title, :requirement, length: { in: 6..30 }, presence: true #specs done
  validates :job_description, length: { in: 50..500 }, presence: true   #specs done
  validates :no_of_openings, presence: true                             #specs done
  validates :skills_required, presence: true, length: { minimum: 10 }   #specs done
  
  private
  
  def log_destroy_action
    puts "Job Profiles destroyed"
  end

end