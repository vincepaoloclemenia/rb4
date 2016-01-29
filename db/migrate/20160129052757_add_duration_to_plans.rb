class AddDurationToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :duration_in_days, :integer
  end
end
