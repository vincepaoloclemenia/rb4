class CreatePerBrandOrders < ActiveRecord::Migration
  def change
    create_table :per_brand_orders do |t|
      t.integer    :branch_id 
      t.integer    :order_list_id
      t.integer    :order_per_supplier_id
      t.timestamps null: false
    end
  end
end
