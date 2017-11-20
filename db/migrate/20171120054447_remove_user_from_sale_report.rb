class RemoveUserFromSaleReport < ActiveRecord::Migration
  def change
    remove_column :sale_reports, :user_id
  end
end
