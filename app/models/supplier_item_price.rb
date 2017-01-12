class SupplierItemPrice < ActiveRecord::Base
	belongs_to :supplier
	belongs_to :item
end
