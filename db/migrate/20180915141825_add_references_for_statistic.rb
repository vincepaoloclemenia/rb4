class AddReferencesForStatistic < ActiveRecord::Migration
  def change
    add_reference :statistics, :settlement, index: true    
    
  end
end
