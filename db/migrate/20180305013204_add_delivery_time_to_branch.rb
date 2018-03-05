class AddDeliveryTimeToBranch < ActiveRecord::Migration
  def change
    add_column :branches, :delivery_time, :string
  end
end
