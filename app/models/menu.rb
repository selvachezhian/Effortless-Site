class Menu < ActiveRecord::Base

  # Relationships
  belongs_to :site
  belongs_to :page

  # Validations
  validates :name, presence: true
end
