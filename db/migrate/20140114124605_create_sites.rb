class CreateSites < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :sites, id: :uuid do |t|
      t.string :name
      t.string :domain
      t.uuid :user_id
      t.uuid :site_status_id
      t.uuid :html_template_id
      t.uuid :theme_id
      t.uuid :logo_id
      t.uuid :banner_id
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamps
    end
    add_index(:sites, :user_id)
    add_index(:sites, :site_status_id)
    add_index(:sites, :html_template_id)
    add_index(:sites, :theme_id)
    add_index(:sites, :logo_id)
    add_index(:sites, :banner_id)
    add_index(:sites, :created_by_id)
    add_index(:sites, :updated_by_id)
  end
end
