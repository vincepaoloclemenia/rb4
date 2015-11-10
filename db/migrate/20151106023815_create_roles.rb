class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.belongs_to :client, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.string :role_level

      t.timestamps null: false
    end
  end
end
