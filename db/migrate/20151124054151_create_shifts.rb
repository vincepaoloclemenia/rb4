class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :name
      t.belongs_to :brand, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end