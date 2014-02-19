class Menu < ActiveRecord::Base

  # Relationships
  belongs_to :site
  belongs_to :page

  # Validations
  validates :name, presence: true

  def self.reorder_menu( site, new_order )
    new_order.split(',').each_with_index do |id, index|
      site.menus.find(id).update_column(:sequence_order, ( index + 1 ))
    end
  end

end
