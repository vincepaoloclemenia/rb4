class RevertDataType < ActiveRecord::Migration
  def change
    remove_column :sale_reports, :from
    remove_column :sale_reports, :to
    add_column :sale_reports, :date_from, :datetime
    add_column :sale_reports, :date_to, :datetime
  end
end
