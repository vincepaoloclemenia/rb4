class CreateClientUserAccesses < ActiveRecord::Migration
  def change
    create_table :client_user_accesses do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :client, index: true, foreign_key: true
      t.belongs_to :role, index: true, foreign_key: true
      t.belongs_to :brand, index: true, foreign_key: true
      t.belongs_to :branch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
