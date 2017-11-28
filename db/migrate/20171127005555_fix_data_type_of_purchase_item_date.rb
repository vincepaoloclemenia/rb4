class FixDataTypeOfPurchaseItemDate < ActiveRecord::Migration
  def change
    change_column :purchase_items, :date_of_purchase, :date
  end
end
