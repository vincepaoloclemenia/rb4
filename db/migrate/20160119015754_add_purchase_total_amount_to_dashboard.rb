class AddPurchaseTotalAmountToDashboard < ActiveRecord::Migration
  def change
    add_column :dashboards, :purchase_total_amount, :decimal
  end
end
