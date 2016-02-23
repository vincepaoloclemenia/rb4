module ItemCostAnalysisReportsHelper

  def all_purchases(item_ids)
    purchases_array = Array.new
    a = Date.strptime(params[:date_entry], "%m/%d/%Y")
    a = a - 1.month

    purchases = Purchase.where(purchase_date: a.beginning_of_month..a.end_of_month).pluck(:id)
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
      hash[:total] = check_value_if_nan(get_total(quantity, unit_cost).round(2).to_f)
      purchases_array << hash
    end
    purchases_array << get_summation_of_amount(purchases_array)
    return purchases_array
  end

  def get_ending_inventories(item_ids, inventory_items, all_purchase)
    arr = Array.new
    items = get_items(item_ids)
    items.is_a?(Array) ? items = items : items = [items]
    items.each do |item|
      hash = Hash.new
      hash[:item_id] = item.id
      if inventory_items.blank?
        hash[:quantity] = 0.0
      else
        hash[:quantity] = get_information(inventory_items, item.id).stock_count
      end
      subcat_item = get_subcat_items(item.id).first
      purchase = get_information(all_purchase, item.id)
      total = subcat_item[:total] + purchase[:total]
      qty = subcat_item[:quantity] + purchase[:quantity]
      hash[:unit_cost] = get_unit_cost(total, qty)
      hash[:total] = get_total(hash[:quantity], hash[:unit_cost])
      arr << hash
    end
    return arr
  end

  def get_subcat_items(item_ids)
    arr = Array.new
    items = get_items(item_ids)
    items.is_a?(Array) ? items = items : items = [items] 
    items.each do |item|
      hash = Hash.new
      hash[:item_info] = item 
      hash[:quantity] = get_inventory_item(item.id).stock_count
      hash[:unit_cost] = item.item_value.to_f
      hash[:total] = get_total(hash[:quantity], hash[:unit_cost])
      arr << hash
    end
    return arr
  end
  
  def get_subcategory_and_item_ids(category, inventory_items)
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

  def get_cost_of_total_goods(purchases, ending_inventories, item_ids)
    arr = Array.new
    item_ids.each do |item|
      subcat_item = get_subcat_items(item).first
      purchase = get_information(purchases, item)
      ending_inventory = get_information(ending_inventories, item)
      hash = Hash.new
      hash[:item_id] = item
      hash[:quantity] = (subcat_item[:quantity] + purchase[:quantity]) - ending_inventory[:quantity]
      hash[:total] = check_value_if_nan((subcat_item[:total] + purchase[:total]) - ending_inventory[:total])
      hash[:unit_cost] = get_unit_cost(hash[:total], hash[:quantity])
      arr << hash
    end
    arr << get_summation_of_amount(arr)
    return arr
  end

  def get_summation_of_amount(array)
    total = 0
    array.each do |a|
      total += a[:total]
    end
    return check_value_if_nan(total)
  end

  def get_information(array, item_id)
    array.each do |a|
      if a[:item_id] == item_id
        puts a
        return a
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
