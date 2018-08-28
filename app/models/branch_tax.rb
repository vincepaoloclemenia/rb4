class BranchTax < ActiveRecord::Base
  belongs_to :branch
  belongs_to :tax_type
end
