json.purchases do |json|
    json.array! @purchases.keys do |key|
        json.parent_category key
        pis = @purchases[key].group_by { |x| x.item.category.name }
        json.purchases pis.keys do |pi_key|    
            purs_items = pis[pi_key].group_by { |pur| pur.item_id }
            json.subcategory pi_key       
            json.purchase_items purs_items.keys do |pi|
                item = Item.find pi
                json.unit item.unit.name
                json.item_name item.name
                json.quantity purs_items[pi].map { |pur_item| pur_item.quantity }.sum.round(2)
                json.purchase_item_amount to_peso(purs_items[pi].map { |pur_item| pur_item.purchase_item_amount }.sum.round(2) )
                json.item_total_net to_peso(purs_items[pi].map { |pur_item| pur_item.item_total_net }.sum.round(2))
            end
            json.total_amount_per_category to_peso(pis[pi_key].map(&:item_total_net).sum.round(2))
        end
        json.total_amount_within_month to_peso(@purchases[key].map(&:item_total_net).sum)
    end
end

json.overall to_peso(@purchases.keys.map { |x| @purchases[x].map(&:item_total_net).sum.to_f }.sum)