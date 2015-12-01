class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.belongs_to :branch, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.datetime :entry_date

      t.timestamps null: false
    end
  end
end
