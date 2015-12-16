class AddColorToBranch < ActiveRecord::Migration
  def change
    add_column :branches, :color, :string
  end
end
