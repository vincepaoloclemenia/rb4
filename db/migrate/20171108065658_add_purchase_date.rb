class AddPurchaseDate < ActiveRecord::Migration
  def change
    add_column :purchase_items, :date_of_purchase, :datetime
  end
end
