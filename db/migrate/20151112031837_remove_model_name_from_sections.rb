class RemoveModelNameFromSections < ActiveRecord::Migration
  def up
  	remove_column :sections, :model_name
  end

  def down
  	add_column :sections, :model_name, :string
  end
end
