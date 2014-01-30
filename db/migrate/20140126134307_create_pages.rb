class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages, id: :uuid do |t|
      t.string :name
      t.uuid :site_id
      t.text :content
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamps
    end
    add_index(:pages, :site_id)
    add_index(:pages, :created_by_id)
    add_index(:pages, :updated_by_id)
  end
end
