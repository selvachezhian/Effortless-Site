class Page < ActiveRecord::Base

  # Relationships
  has_many :menus

  belongs_to :site

  # Validations
  validates :name, :content, presence: true

end
