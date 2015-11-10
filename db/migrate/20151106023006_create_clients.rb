class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :landline
      t.string :mobile
      t.string :fax
      t.string :website
      t.string :email
      t.string :address1
      t.string :address2
      t.string :contact
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_uploaded_at
      t.integer :flag, default: 1

      t.timestamps null: false
    end
  end
end
