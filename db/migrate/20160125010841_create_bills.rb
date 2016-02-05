class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.belongs_to :subscription, index: true, foreign_key: true
      t.decimal :amount, precision: 15, scale: 2
      t.string :status
      t.string :payer_email
      t.string :transaction_id
      t.string :plan_name
      t.text :branches
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
