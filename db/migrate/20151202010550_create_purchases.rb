class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.belongs_to :client, index: true, foreign_key: true
      t.belongs_to :brand, index: true, foreign_key: true
      t.belongs_to :branch, index: true, foreign_key: true
      t.belongs_to :supplier, index: true, foreign_key: true
      t.date :purchase_date
      t.string :invoice_number
      t.integer :user_created_by_id
      t.integer :user_modified_by_id

      t.timestamps null: false
    end
  end
end
