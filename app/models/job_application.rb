class JobApplication < ApplicationRecord
  enum status: %i[ not_defined accepted rejected ]

end
