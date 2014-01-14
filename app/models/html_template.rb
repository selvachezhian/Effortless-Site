class HtmlTemplate < ActiveRecord::Base

  # Relationships
  has_many :sites
  has_many :themes

end
