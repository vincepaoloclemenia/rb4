module ItemCostAnalysisReportsHelper

  def get_purchase(all_purchase, item_id)
    all_purchase.each do |purchase|
      if purchase[:item_id] == item_id
        return purchase
      end
    end
  end

  def all_purchases(subcategory)
    purchases_array = Array.new
    a = Date.today
    item_ids = subcategory.items.pluck(:id)
    purchases = Purchase.where(purchase_date: a.beginning_of_month..a).pluck(:id)
    item_ids.each do |id|
      purchase_items = PurchaseItem.where(purchase_id: purchases, item_id: id)
      quantity = 0
      unit_cost = 0
      purchase_items.each do |purchase_item|
        quantity += purchase_item.quantity
        unit_cost += purchase_item.purchase_item_amount
      end
      unit_cost = unit_cost.to_f / purchase_items.count
      hash = Hash.new
      hash[:item_id] = id
      hash[:quantity] = quantity.to_f
      hash[:unit_cost] = check_value_if_nan(unit_cost.round(2).to_f)
      hash[:total_cost] = check_value_if_nan(get_total(quantity, unit_cost).round(2).to_f)
      purchases_array << hash
    end
    subcategory_total = 0
    purchases_array.each do |pa|
      subcategory_total += pa[:total_cost]
    end

    purchases_array << subcategory_total
  end



	# def get_purchases(purchase_date, item_id)
 #    quantity = 0
 #    unit_cost = 0
 #    total_cost = 0
 #    purchase_info = Array.new
 #    # purchases = Purchase.where(purchase_date: purchase_date.beginning_of_month..purchase_date).pluck(:id)
 #    # purchase_items = PurchaseItem.where(purchase_id: purchases, item_id: item_id)
 #    purchase_items = get_purchase_items(purchase_date, item_id)
 #    purchase_items.each do |pi|
 #    	quantity += pi.quantity
 #    	unit_cost += pi.purchase_item_amount
 #    end
 #    hash = Hash.new
 #    unit_cost = unit_cost.to_f/purchase_items.count
 #    hash[:quantity] = quantity
 #    hash[:unit_cost] = check_value_if_nan(unit_cost.round(2).to_f)
 #    hash[:total_cost] = check_value_if_nan(quantity * unit_cost)
 #    return hash
 #  end

  # def get_purchase_items(purchase_date, item_ids)
  #   purchases = Purchase.where(purchase_date: purchase_date.beginning_of_month..purchase_date).pluck(:id)
  #   purchase_items = PurchaseItem.where(purchase_id: purchases, item_id: item_ids)
  #   return purchase_items
  # end

  # def get_purchase_total(purchase_date, subcategory)
  #   purchase_total = 0
  #   item_ids = subcategory.items.pluck(item_id)
  #   purchase_items = get_purchase_items(purchase_date, item_ids)
  #   purchase_items.each do |pi|
  #     purchase_total += pi
  #   end
  # end

  # def get_subcategory_total(subcategory)
  #   item_ids = subcategory.items.pluck(item_ids)
  #   items = get_items(item_ids)
  #   item
  # end
  
  def get_subcategory_and_items(category, inventory_items)
    if inventory_items.blank?
      return
    else
      subcat_info = Array.new
      category.subcategories.each do |subcategory|
        hash = Hash.new
        if subcategory.items.present?
          item_ids = Array.new
          subcategory.items.each do |item|
            if inventory_items.include?(item.id)
              item_ids << item.id
              hash[:subcategory] = subcategory
            end
          end
          hash[:item_ids] = item_ids unless item_ids.blank?
        end
        subcat_info << hash unless hash.blank?
      end
      return subcat_info
    end
  end

  def get_ending_inventory_item_stock_count(item_id, inventory_items)
    if inventory_items.blank?
      return 0.0
    else
      inventory_items.each do |ii|
        if ii.item.id == item_id
          puts "Inventory Item #{ii.id}"
          print "stock_count #{ii.stock_count}"
          puts "Item name #{ii.item.name}"
          puts "Item id #{ii.item.id}"
          return ii.stock_count
        end
      end
    end
  end

  def get_items(item_ids)
    items = Item.find(item_ids)
    return items
  end

  def get_inventory_item(item_id)
    inventory_item = InventoryItem.find_by_item_id(item_id)
    return inventory_item
  end

  def check_value_if_nan(variable)
    variable.is_a?(Float) && variable.nan? ? variable = 0.00 : variable = variable
    return variable
  end

  def get_unit_cost(amount, qty)
    unit_cost = (amount/qty).round(2)
    return unit_cost
  end

  def get_total(qty, unit_cost)
    if qty.blank? || unit_cost.blank?
      total = 0
    else 
      total = (qty * unit_cost).round(2)
    end
    return total
  end

end
