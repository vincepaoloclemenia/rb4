class CreateItemsSupplierTable < ActiveRecord::Migration
  def change
    create_join_table :items, :suppliers do |t|
      t.index [:item_id, :supplier_id]
    end
  end
end
