module ReportsHelper

	def get_price_movement(purchased_items)
		past_price = Array.new
		current_price = purchased_items
		price_movement_values = Array.new
		hash = Hash.new
			
		current_price.each_with_index do |a, index|
			if past_price.empty?
				past_price.append(0)
			else
				past_price.append(current_price[index-1])
			end

			if past_price[index] != 0
				a = current_price[index]
				price_movement_value = past_price[index].purchase_item_amount - current_price[index].purchase_item_amount
				hash = { :branch_name => a.purchase.branch.name, :item => a.item.name, :prev_amount => past_price[index].purchase_item_amount.to_i, :present_amount => a.purchase_item_amount.to_i, :price_movement => price_movement_value }
      end
      price_movement_values.append(hash)
		end
		
		return price_movement_values
	end

	def get_purchased_items(item_id, date_range)
		@purchase_ids = Purchase.select(:id).where(purchase_date: date_range, brand_id: current_brand)
		@purchase_items = PurchaseItem.where(purchase_id: @purchase_ids, item_id: item_id).order('purchase_item_amount ASC')
		
		return @purchase_items
	end

	def get_price_movement_items(item_ids, date_range)
		price_movement = Array.new
		item_ids.each do |item_id|
			purchased_items = get_purchased_items(item_id, date_range)
			price_movement = price_movement + get_price_movement(purchased_items)
		end
		price_movement = price_movement.sort_by{ |a| a[:price_movement].to_i}

		return price_movement
	end
end