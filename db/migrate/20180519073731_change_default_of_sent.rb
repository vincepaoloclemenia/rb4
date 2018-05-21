class ChangeDefaultOfSent < ActiveRecord::Migration
  def change
    change_column :purchase_orders, :sent, :boolean, default: false
  end
end
