class MakeRecordPolymorphic < ActiveRecord::Migration
  def change
    rename_column :activities, :record_id, :recordable_id
    add_column :activities, :recordable_type, :string
  end
end
