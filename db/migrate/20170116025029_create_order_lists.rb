class CreateOrderLists < ActiveRecord::Migration
  def change
    create_table :order_lists do |t|
      t.datetime :po_date
      t.string   :po_number
      t.text     :terms
      t.text     :remarks
      t.integer  :supplier_id
      t.timestamps null: false
    end

    add_column :order_per_suppliers, :order_list_id, :integer

  end
end
