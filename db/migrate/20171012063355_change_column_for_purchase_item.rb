class ChangeColumnForPurchaseItem < ActiveRecord::Migration
  def change
    add_column :purchase_items, :unit_name, :string
  end
end
