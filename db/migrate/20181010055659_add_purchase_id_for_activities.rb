class AddPurchaseIdForActivities < ActiveRecord::Migration
  def change
    add_column :activities, :purchase_id, :integer, index: true
    add_column :activities, :sale_id, :integer, index: true
  end
end
