class CreatePaymentNotifications < ActiveRecord::Migration
  def change
    create_table :payment_notifications do |t|
      t.text :params
      t.string :transaction_type
      t.string :status
      t.string :transaction_id
      t.belongs_to :subscription, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
