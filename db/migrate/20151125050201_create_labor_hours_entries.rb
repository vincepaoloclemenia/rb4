class CreateLaborHoursEntries < ActiveRecord::Migration
  def change
    create_table :labor_hours_entries do |t|
      t.belongs_to :labor_hour
      t.date :working_date
      t.belongs_to :branch
      t.decimal :regular
      t.decimal :overtime
      t.decimal :night_differential
      t.decimal :legal_holiday
      t.decimal :special_holiday
      t.decimal :absent
      t.decimal :late
      t.decimal :rest_day

      t.timestamps null: false
    end
  end
end
