class CreateSiteStatuses < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :site_statuses, id: :uuid do |t|
      t.string :name
      t.timestamps
    end
    SiteStatus.create!(name: 'Online')
    SiteStatus.create!(name: 'Offline')
  end
end
