class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :client, index: true, foreign_key: true
      t.belongs_to :plan, index: true, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.string :status
      t.string :paypal_customer_token
      t.string :paypal_recurring_profile_token
      t.string :paypal_email
      t.string :paypal_payment_token
      t.datetime :previous_payment
      t.datetime :next_payment
      t.integer :branch_count
      t.string :period
      t.decimal :amount, precision: 15, scale: 2
      t.decimal :outstanding_balance, precision: 15, scale: 2

      t.timestamps null: false
    end
  end
end
