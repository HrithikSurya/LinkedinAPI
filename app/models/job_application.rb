class JobApplication < ApplicationRecord
  belongs_to :job_profile  #specs done
  belongs_to :user_profile #specs done
  
  enum status: %i[ not_defined accepted rejected ] #specs done

  validates :status, presence: true #specs done

end
