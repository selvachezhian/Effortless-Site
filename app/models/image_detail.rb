class ImageDetail < ActiveRecord::Base

  # Relationships
  belongs_to :image

  # Named Scopes
  scope :original_image, -> { where(logical_name: 'original') }
  scope :by_dimensions, -> (width, height) { where('width = ? and height = ?', width, height) }

end
