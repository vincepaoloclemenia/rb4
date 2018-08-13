class AddPercentageScope < ActiveRecord::Migration
  def change
    add_column :sales_non_misces, :percentage_scope, :boolean
    add_column :non_misces, :percentage_scope, :boolean
  end
end
