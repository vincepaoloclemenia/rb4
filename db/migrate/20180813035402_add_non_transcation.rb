class AddNonTranscation < ActiveRecord::Migration
  def change
    add_column :sales_stats, :non_transac, :boolean
    add_column :statistics, :non_transac, :boolean
  end
end
