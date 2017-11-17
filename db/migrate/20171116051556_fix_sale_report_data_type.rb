class FixSaleReportDataType < ActiveRecord::Migration
  def change
    change_column :sale_reports, :from, :string
    change_column :sale_reports, :to, :string
  end
end
