class Theme < ActiveRecord::Base

  # Relationships
  has_many :sites

  belongs_to :html_template

end
