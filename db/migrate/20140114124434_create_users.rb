class CreateUsers < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :users, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :email
      t.string :password
      t.uuid :role_id
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamps
    end
    add_index(:users, :role_id)
    add_index(:users, :created_by_id)
    add_index(:users, :updated_by_id)

    User.create!(first_name: 'Trial', last_name: 'User', email: 'trial.user@easysite.com', password: 'trial.user', role_id: Role.find_by_name('Admin').id)
  end
end
