class ChangeDateFormatOfPreviousDateEntryInDashboards < ActiveRecord::Migration
  def change
  	change_column :dashboards, :previous_date_entry, :date
  end
end
