class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.belongs_to :role, index: true, foreign_key: true
      t.belongs_to :section, index: true, foreign_key: true
      t.belongs_to :client, index: true, foreign_key: true
      t.boolean :is_create
      t.boolean :is_read
      t.boolean :is_update
      t.boolean :is_destroy

      t.timestamps null: false
    end
  end
end
