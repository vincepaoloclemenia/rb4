class SupplierItemPrice < ActiveRecord::Base
	belongs_to :supplier
	belongs_to :item
	belongs_to :unit
	validates_presence_of :unit_id, :item_id
	validate :below_zero?

	def below_zero?		
		errors.add(:supplier_amount, ' must be greater than 0') if supplier_amount <= 0
	end
end
