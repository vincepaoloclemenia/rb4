class Purchase < ActiveRecord::Base
  belongs_to :client
  belongs_to :brand
  belongs_to :branch
  belongs_to :supplier
  has_many :purchase_items, dependent: :destroy
	belongs_to :created_by, class_name: 'User', :foreign_key => 'user_created_by_id'
  belongs_to :modified_by, class_name: 'User', foreign_key: 'user_modified_by_id'

  accepts_nested_attributes_for :purchase_items,  :reject_if => :all_blank, :allow_destroy => :true

  validates :invoice_number, :purchase_date, :supplier_id, :brand_id, :branch_id, presence: true

	def self.get_total_purchases_per_branch()
		d = Date.today - 1 
		purchase_array = Array.new
		brands = Brand.all.pluck(:id)

		brands.each do |brand|
			brand.branches.each_with_index do |branch, index|
				hash = Hash.new
				hash[:branch_id] = branch.id
				hash[:branch_name] = branch.name
				@branch_purchases = Purchase.where(branch_id: branch, brand_id: brand, purchase_date: d)
				hash[:total_purchases_amount] = get_total_purchases(@branch_purchases)
				purchase_array[index] = hash
			end
		end
		return purchase_array
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

	def sample
		puts "Dashboard Model"
	end
end
