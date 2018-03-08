class AddReferencesToPoItems < ActiveRecord::Migration
  def change
    add_belongs_to(:purchase_order_items, :branch, index: true)
    add_belongs_to(:purchase_order_items, :brand, index: true)
  end
end
