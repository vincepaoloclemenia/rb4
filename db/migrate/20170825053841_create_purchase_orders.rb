class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
    	t.integer :client_id
    	t.integer :brand_id
    	t.integer :branch_id
    	t.date    :po_date
    	t.date    :pr_date
    	t.string  :po_number
    	t.string  :pr_number
    	t.text		:remarks
    	t.text		:terms
    	t.string	:status
    	t.integer :supplier_id
      t.timestamps null: false
    end
  end
end