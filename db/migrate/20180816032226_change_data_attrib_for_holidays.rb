class ChangeDataAttribForHolidays < ActiveRecord::Migration
  def change
    add_reference :holidays, :branch, index: true
    change_column :holidays, :date, :date
  end
end
