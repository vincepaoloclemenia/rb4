class ChangeActivityColumn < ActiveRecord::Migration
  def change
    remove_column :activities, :involved_record
    add_column :activities, :record_id, :integer
  end
end
