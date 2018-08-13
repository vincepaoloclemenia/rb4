class AddIndexToSalesNonMisce < ActiveRecord::Migration
  def change
    remove_column :sales_non_misces, :non_miscelaneous_id
    add_reference :sales_non_misces, :non_misce, index: true
  end
end
