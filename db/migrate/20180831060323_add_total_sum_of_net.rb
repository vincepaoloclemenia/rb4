class AddTotalSumOfNet < ActiveRecord::Migration
  def change
    add_column :purchases, :total_net_sum, :decimal, default: 0.0
  end
end
