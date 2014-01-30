class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus, id: :uuid do |t|
      t.string :name
      t.uuid :site_id
      t.uuid :page_id
      t.integer :sequence_order
      t.boolean :active
      t.string :ancestry
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamps
    end
    add_index(:menus, :site_id)
    add_index(:menus, :page_id)
    add_index(:menus, :ancestry)
    add_index(:menus, :created_by_id)
    add_index(:menus, :updated_by_id)
  end
end
