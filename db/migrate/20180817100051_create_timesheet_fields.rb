class CreateTimesheetFields < ActiveRecord::Migration
  def change
    create_table :timesheet_fields do |t|
      t.string :name
      t.text :description
      t.references :brand, index: true
      t.boolean :is_active

      t.timestamps null: false
    end
    create_table :timesheets do |t|
      t.string :name
      t.references :timesheet_field, index: true
      t.references :employee, index: true
      t.references :branch, index: true
      t.decimal :value, default: 0.0
      t.date :date
      t.boolean :is_absent

      t.timestamps null: false
    end
  end
end
