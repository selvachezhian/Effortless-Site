class CreateBanners < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :banners, id: :uuid do |t|
      t.string :name
      t.uuid :image_id
      t.uuid :site_id
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamps
    end
    add_index(:banners, :image_id)
    add_index(:banners, :site_id)
    add_index(:banners, :created_by_id)
    add_index(:banners, :updated_by_id)
  end
end
