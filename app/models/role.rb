class Role < ActiveRecord::Base

  # Relationships
  has_many :users

end
