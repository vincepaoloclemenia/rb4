class DropAndCreateNewTable < ActiveRecord::Migration
  def change
    remove_index :sales_non_misces, :non_miscelaneous_id
    drop_table :non_miscelaneouses
    create_table :non_misces do |t|
      t.belongs_to :client, index: true
      t.string :name
      t.text :description
      t.boolean :is_active
      t.timestamps null: false
    end
  end
end
