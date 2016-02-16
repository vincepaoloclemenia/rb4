class ItemCostAnalysisReportsController < ApplicationController
  def index
    # raise
    # end
    # raise
  	# @beginning_inventory = beginning_inventory
  	@beginning_inventory = get_categories
  end

  # def beginning_inventory
  # 	items = Array.new
		# inventory = Inventory.where("entry_date <= ? ", Date.today).last
		# inventory_items = InventoryItem.where(inventory_id: inventory.id)
		# inventory_items.each_with_index do |ii, index|
  # 		hash = Hash.new
  # 		hash[:stock_count] = ii.stock_count
  # 		hash[:item_id] = ii.item_id
		# 	items[index] = hash
		# end
		# # inventory_items.each_with_index do |ii, index|
		# item_ids = items.map{|a| a[:item_id]} 
		# item_ids.each do |i|
		# 	get_item_category(i)
		# end
		# # item_info = Item.where(id: item_ids)
		# # item_info.each do |i|
		# # end

		# return item_info
  # end

  def list_categories
  	categories = Array.new
  	list_item_id.each do |item|
  		parent_id = Item.find(item).category.parent_id
  		categories << parent_id
  	end
  	return categories.uniq
  end

  def list_item_id
  	items = Array.new
		inventory = Inventory.where("entry_date <= ? ", Date.today).last
    inventory_items = InventoryItem.where(inventory_id: inventory.id)
		inventory_items.each do |ii|
  		items << ii.item_id
		end
		return items
  end

  def get_categories
  	category_ids = Array.new
  	list_item_id.each do |item|
  		category_id = Item.select("category_id").find(item)
  		category = Category.where(id: category_id.category_id)
  		category_ids << category_id.category_id
  	end
		list_categories
		sub_categories(category_ids)
  	# return category_ids
  end

  # def get_categories(current_date)
      
  # end

  def sub_categories(category_ids)
  	category_items = Array.new
  	list_categories.each do |parent_id|
  		hash = Hash.new
  		hash[:category_id] = parent_id
  		sub_categories = Category.find(parent_id).subcategories.pluck(:id)
  		not_needed_ids = sub_categories - category_ids
  		hash[:sub_categories] = (sub_categories -= not_needed_ids)
  		category_items << hash
  	end

  	return category_items
  end



end
