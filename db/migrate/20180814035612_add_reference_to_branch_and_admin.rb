class AddReferenceToBranchAndAdmin < ActiveRecord::Migration
  def change
    add_reference :employee_types, :brand, index: true
    add_reference :employee_types, :branch, index: true
  end
end
