class CreateRoles < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :roles, id: :uuid do |t|
      t.string :name
      t.timestamps
    end
    Role.create!(name: 'Admin')
    Role.create!(name: 'User')
  end
end
