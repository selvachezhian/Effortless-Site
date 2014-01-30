class CreateImages < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :images, id: :uuid do |t|
      t.string :name
      t.string :alt_tag
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamps
    end
    add_index(:images, :created_by_id)
    add_index(:images, :updated_by_id)
  end
end
