class AddPackaging < ActiveRecord::Migration
  def change
    add_column :purchase_items, :packaging, :string
    add_column :purchase_order_items, :packaging, :string
  end
end
