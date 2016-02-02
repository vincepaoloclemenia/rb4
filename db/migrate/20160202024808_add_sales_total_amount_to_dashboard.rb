class AddSalesTotalAmountToDashboard < ActiveRecord::Migration
  def change
    add_column :dashboards, :sales_total_amount, :decimal
  end
end
