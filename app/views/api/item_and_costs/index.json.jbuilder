json.purchase_items_within_month do |json|
    json.array! @purchase_items_within_month.keys do |key|
        json.parent_category key
        pis = @purchase_items_within_month[key].group_by { |x| x.item.category.name }
        json.purchases pis.keys do |pi_key|    
            json.subcategory pi_key       
            json.purchase_items pis[pi_key] do |purchase_item|
                json.id purchase_item.id
                json.unit purchase_item.item.unit.name
                json.item_name purchase_item.item.name
                json.quantity purchase_item.quantity.round(2)
                json.purchase_item_amount to_peso(purchase_item.purchase_item_amount.round(2))
                json.item_total_net to_peso(purchase_item.item_total_net.round(2))
            end
            json.total_amount_per_category to_peso(pis[pi_key].map(&:item_total_net).sum.round(2))
        end
        json.total_amount_within_month to_peso(@purchase_items_within_month[key].map(&:item_total_net).sum)
    end
end
json.last_month_total to_peso(@purchase_items_within_month.keys.map { |x| @purchase_items_within_month[x].map(&:item_total_net).sum.to_f }.sum)
json.last_week_total to_peso(@purchase_items_last_week.keys.map { |x| @purchase_items_last_week[x].map(&:item_total_net).sum.to_f }.sum)
json.last_week_range @range_lw
json.this_month_range @range_tm

json.purchase_items_last_week do |json|
    json.array! @purchase_items_last_week.keys do |key|
        json.parent_category key
        pis = @purchase_items_last_week[key].group_by { |x| x.item.category.name }
        json.purchases pis.keys do |pi_key|    
            json.subcategory pi_key       
            json.purchase_items pis[pi_key] do |purchase_item|
                json.id purchase_item.id
                json.unit purchase_item.item.unit.name
                json.item_name purchase_item.item.name
                json.quantity purchase_item.quantity.round(2)
                json.purchase_item_amount to_peso(purchase_item.purchase_item_amount.round(2))
                json.item_total_net to_peso(purchase_item.item_total_net.round(2))
            end
            json.total_amount_per_category to_peso(pis[pi_key].map(&:item_total_net).sum.round(2))
        end
        json.total_amount_within_month to_peso(@purchase_items_last_week[key].map(&:item_total_net).sum)
    end
end
