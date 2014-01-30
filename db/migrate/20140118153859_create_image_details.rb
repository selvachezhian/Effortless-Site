class CreateImageDetails < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :image_details, id: :uuid do |t|
      t.string :name
      t.string :alt_tag
      t.string :logical_name
      t.string :image_path
      t.uuid :image_id
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamps
    end
    add_index(:image_details, :created_by_id)
    add_index(:image_details, :updated_by_id)
  end
end
