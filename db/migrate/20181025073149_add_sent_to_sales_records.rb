class AddSentToSalesRecords < ActiveRecord::Migration
  def change
    add_column :sales, :date_sent, :datetime
  end
end
