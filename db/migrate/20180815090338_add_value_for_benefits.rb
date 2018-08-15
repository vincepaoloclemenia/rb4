class AddValueForBenefits < ActiveRecord::Migration
  def change
    add_column :benefits, :value, :decimal, precision: 16, scale: 2, default: 0.0
  end
end
