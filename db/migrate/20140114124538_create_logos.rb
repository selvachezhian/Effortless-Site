class CreateLogos < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :logos, id: :uuid do |t|
      t.string :name
      t.uuid :image_id
      t.uuid :site_id
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamps
    end
    add_index(:logos, :image_id)
    add_index(:logos, :site_id)
    add_index(:logos, :created_by_id)
    add_index(:logos, :updated_by_id)
  end
end
