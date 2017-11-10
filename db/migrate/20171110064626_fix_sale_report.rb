class FixSaleReport < ActiveRecord::Migration
  def change
    change_column :sale_reports, :total_sales, :integer
  end
end
