module ItemCostAnalysisReportsHelper
	def category_name(category_id)
		category = Category.select("name").find(category_id)
		return category.name
	end

	def items_per_sub_category(category_id)
		items = Item.where(category_id: category_id)
		return items
	end

	def get_inventory_item(id)
		inventory_item = InventoryItem.find(id)
		return inventory_item
	end

	def get_purchases(purchase_date, item_id)
    quantity = 0
    unit_cost = 0
    total_cost = 0
    purchase_info = Array.new
    purchases = Purchase.where("purchase_date >= ? AND purchase_date <= ? ", purchase_date.beginning_of_month, purchase_date).pluck(:id)
    purchase_items = PurchaseItem.where(purchase_id: purchases, item_id: item_id)
    purchase_items.each do |pi|
    	quantity += pi.quantity
    	unit_cost += pi.purchase_item_amount
    end
    hash = Hash.new
    unit_cost = unit_cost.to_f/ purchase_items.count
    hash[:quantity] = quantity
    hash[:unit_cost] = check_value_if_nan(unit_cost.round(2).to_f)
    hash[:total_cost] = check_value_if_nan(quantity * unit_cost)
    return hash
  end

  def check_value_if_nan(variable)
    variable.is_a?(Float) && variable.nan? ? variable = 0.00 : variable = variable
    return variable
  end

end
