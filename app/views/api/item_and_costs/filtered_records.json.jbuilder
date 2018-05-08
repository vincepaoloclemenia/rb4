json.purchases do |json|
    json.array! @purchases.keys do |key|
        json.parent_category key
        pis = @purchases[key].group_by { |x| x.item.category.name }
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
        json.total_amount_within_month to_peso(@purchases[key].map(&:item_total_net).sum)
    end
end

json.overall to_peso(@purchases.keys.map { |x| @purchases[x].map(&:item_total_net).sum.to_f }.sum)