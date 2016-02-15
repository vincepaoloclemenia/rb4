module ItemCostAnalysisReportsHelper
	def category_name(category_id)
		category = Category.select("name").find(category_id)
		return category.name
	end

	def items_per_sub_category(category_id)
		items = Item.where(category_id: category_id)
		return items
	end

	
end
