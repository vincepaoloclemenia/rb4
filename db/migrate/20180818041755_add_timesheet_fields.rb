class AddTimesheetFields < ActiveRecord::Migration
  def change
    add_column :timesheets, :regular_hours, :decimal
    add_column :timesheets, :overtime, :decimal
    add_column :timesheets, :night_differential, :decimal
    add_column :timesheets, :special_holiday, :decimal
    add_column :timesheets, :special_holiday_ot, :decimal
    add_column :timesheets, :legal_holiday, :decimal
    add_column :timesheets, :legal_holiday_ot, :decimal
    add_column :timesheets, :tardiness, :decimal
  end
end
