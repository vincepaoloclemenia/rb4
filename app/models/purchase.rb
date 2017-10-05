class Purchase < ActiveRecord::Base
  belongs_to :client
  belongs_to :brand
  belongs_to :branch
  belongs_to :supplier
  has_many :purchase_items, dependent: :destroy
	belongs_to :created_by, class_name: 'User', :foreign_key => 'user_created_by_id'
	belongs_to :modified_by, class_name: 'User', foreign_key: 'user_modified_by_id'
	
	default_scope -> { order(created_at: :desc)}

  accepts_nested_attributes_for :purchase_items,  :reject_if => :all_blank, :allow_destroy => :true

  validates :invoice_number, :purchase_date, :supplier_id, :brand_id, :branch_id, presence: true

	def self.get_total_purchases_per_branch(branch, date)
		@branch_purchases = Purchase.where(branch_id: branch.id, purchase_date: date)
		return get_total_purchases(@branch_purchases)
	end

	def self.get_total_purchases(purchases)
		total_amount = 0
		purchases.each do |purchase|
			purchase.purchase_items.each do |pi|
				total_amount += pi.purchase_item_total_amount
			end
		end
		return total_amount
	end

	
end
