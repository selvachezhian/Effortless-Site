class AddImageColumns < ActiveRecord::Migration
  def change
    add_column :image_details, :width, :integer
    add_column :image_details, :height, :integer

    add_index(:image_details, :width)
    add_index(:image_details, :height)
    add_index(:image_details, :logical_name)
  end
end
