class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  #   primary_abstract_class means that it won't be mapped to a database table on its own,
  # but it serves as a common base class for other models.
end
