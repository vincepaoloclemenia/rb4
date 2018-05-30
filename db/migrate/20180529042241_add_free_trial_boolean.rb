class AddFreeTrialBoolean < ActiveRecord::Migration
  def change
    add_column :subscriptions, :free_trial, :boolean, default: true
  end
end
