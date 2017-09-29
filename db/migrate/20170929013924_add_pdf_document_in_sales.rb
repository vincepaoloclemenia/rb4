class AddPdfDocumentInSales < ActiveRecord::Migration
  def change
    add_column :sales, :daily_sales_record, :string
  end
end
