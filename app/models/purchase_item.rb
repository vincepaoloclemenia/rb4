class PurchaseItem < ActiveRecord::Base
	include PgSearch
	belongs_to :item
	belongs_to :unit
	belongs_to :purchase
	has_one :branch, through: :purchase
	validates :item_id, :quantity, :purchase_item_total_amount, :vat_type, presence: true
	default_scope { joins(:item).order("items.name ASC") }
	#after_destroy { |pi| Activity.find_by_recordable_id(pi.id).destroy } 
	validates_uniqueness_of :item_id, scope: :purchase

	after_commit :update_purchase, on: [:create, :destroy, :update ]

	pg_search_scope :search_item, against: :item_id, using: { tsearch: { any_word: true } }
	pg_search_scope :search_branches, associated_against: { purchase: [:branch_id] }, using: { tsearch: { any_word: true  } }
	pg_search_scope :search_suppliers, associated_against: { purchase: [:supplier_id] }, using: { tsearch: { any_word: true } }
	pg_search_scope :search_for_invoice, associated_against: { purchase: [:invoice_number] }, using: { tsearch: { any_word: true, prefix: true } }

	def get_purchases_per_branch
		d = DateTime.now - 1
		purchase = Purchase.where(brand_item_id: current_brand, purchase_date: Date.today - 1)
		purchase.purchase_items
		branches = current_brand.branches
		branches.each do |branch|
		end
	end

	def item_total_amount
		purchase_item_total_amount.round(2)		
	end

	def item_total_vat
		return vat_type == "VAT-Exempted" ? 0.00 : (purchase_item_total_amount - (purchase_item_total_amount / (1 + (12.0 / 100)).to_d).round(2)).round(2) 
	end

	def item_total_net
		return vat_type == "VAT-Exempted" ? item_total_amount : (purchase_item_total_amount / (1 + (12.0 / 100)).to_d).round(2)
	end

	def self.get_price_movement(date, id)
		current_purchase_item = all.includes(:purchase).where( item_id: id, purchases: { purchase_date: date } )
		current_total = current_purchase_item.map(&:item_total_net).sum
		current_quantity = current_purchase_item.map(&:quantity).sum
		current_amount = current_total > 0 || current_quantity > 0 ? (current_total / current_quantity).round(2) : 0.0
		last_week_purchases = all.includes(:purchase).where( item_id: id, purchases: { purchase_date: date.last_week.all_week } )
		last_month_purchases = all.includes(:purchase).where( item_id: id, purchases: { purchase_date: date.last_month.all_month } )
		last_week_amount = if last_week_purchases.present?
								total = last_week_purchases.map(&:item_total_net).sum
								quantity  = last_week_purchases.map(&:quantity).sum
								(total/quantity).round(2)
							else
								0.0
							end
		last_month_amount = if last_month_purchases.present?
								total = last_month_purchases.map(&:item_total_net).sum
								quantity  = last_month_purchases.map(&:quantity).sum
								(total/quantity).round(2)
							else
								0.0
							end
		last_week_difference = current_amount == 0 || last_week_amount == 0 ? 0.0 : current_amount - last_week_amount	
		last_month_difference = current_amount == 0 || last_month_amount == 0 ? 0.0 : current_amount - last_month_amount 	

		if current_amount > 0
			last_week_percentage = last_week_difference != 0 && last_week_amount != 0 ? ( last_week_difference / last_week_amount) : 0.0
			last_month_percentage = last_month_difference != 0 && last_month_amount != 0 ? ( last_month_difference / last_month_amount) : 0.0
		else
			last_week_percentage = 0.0
			last_month_percentage = 0.0
		end

		return {
			current_amount: current_amount,
			last_week_amount: last_week_amount,
			last_week_difference: last_week_difference,
			last_month_difference: last_month_difference,
			last_month_amount: last_month_amount,
			last_week_percentage: (last_week_percentage * 100).round(2),
			last_month_percentage: (last_month_percentage * 100).round(2),
			last_week_comparison: last_week_difference > 0 || last_week_percentage > 0,
			last_month_comparison: last_month_difference > 0 || last_month_percentage > 0
		}
		
	end
	
	def update_purchase
		if purchase.purchase_items.present?
			total = purchase.purchase_items.map(&:item_total_net).sum
			purchase.update(total_net_sum: total)
		end
	end

	#Class method for searching items
	def self.search_purchased_items(branch_ids, supplier_ids, item_ids, invoice)
		searched_items = self.includes(:purchase).search_branches(branch_ids) + self.includes(:purchase).search_suppliers(supplier_ids)+ self.search_item(item_ids)+ self.includes(:purchase).search_for_invoice(invoice)
		return searched_items.uniq
	end
end
