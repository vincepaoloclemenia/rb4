class EditColumnDailySales < ActiveRecord::Migration
  def change
    rename_column :sales, :daily_sales_record, :daily_sales_record_file_name
    add_column :sales, :daily_sales_record_content_type, :string
    add_column :sales, :daily_sales_record_updated_at, :datetime
    add_column :sales, :daily_sales_record_file_size, :integer

  end
end
