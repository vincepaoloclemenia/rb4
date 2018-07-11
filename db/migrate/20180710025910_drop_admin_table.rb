class DropAdminTable < ActiveRecord::Migration
  def change
    drop_table :admins
    create_table :admins do |t|
      t.string :email
      t.string :password_hash
      t.string :salt
      t.string :username
      t.string :firstname
      t.string :lastname

      t.timestamps null: false
    end
  end
end
