class CreateImageAttachments < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :image_attachments, id: :uuid do |t|
      t.string :name
      t.string :alt_tag
      t.string :entity_type
      t.uuid :entity_id
      t.uuid :image_id
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamps
    end
    add_index(:image_attachments, :created_by_id)
    add_index(:image_attachments, :updated_by_id)
  end
end
