class CreateConversions < ActiveRecord::Migration
  def change
    create_table :conversions do |t|
      t.belongs_to :brand, index: true, foreign_key: true
      t.integer :from_unit_id
      t.integer :to_unit_id
      t.decimal :factor
      t.boolean :is_active, default: true
      t.boolean :is_deleted, default: false

      t.timestamps null: false
    end
  end
end
