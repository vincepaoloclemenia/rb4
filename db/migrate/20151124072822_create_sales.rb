class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :customer_count
      t.integer :transaction_count
      t.belongs_to :branch, index: true, foreign_key: true
      t.integer :created_by_id
      t.integer :first_time_guest
      t.integer :repeat_guest
      t.integer :brand_id
      t.integer :delivery_transaction_count
      t.integer :credit_card_transaction_count
      t.integer :client_id
      t.date :sale_date
      t.integer :delivery_sales
      t.integer :credit_card_sales
      t.integer :service_charge
      t.integer :gc_redeemed
      t.integer :cash_in_drawer
      t.integer :gc_sales
      t.integer :other_income
      t.integer :vat
      t.integer :shift_id

      t.timestamps null: false
    end
  end
end
