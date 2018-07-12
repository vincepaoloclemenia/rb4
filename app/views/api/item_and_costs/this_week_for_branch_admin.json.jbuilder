json.last_week_range @range_lw
json.this_month_range @range_tm

json.items do |json|
    json.array! @items.keys do |key|
        json.parent_category key
        pis = @items[key].group_by { |x| x.category.name }
        json.sub_cats pis.keys do |pi_key|    
            json.subcategory pi_key       
            json.br_items pis[pi_key].map do |item|
                cc = ComputeCost.new(@branch, item.id, @range_tm, "month")
                json.beg_quantity cc.beginning_inventory[:quantity]
                json.beg_unit_cost to_peso(cc.beginning_inventory[:unit_cost])
                json.beg_amount to_peso(cc.beginning_inventory[:amount])
                json.purchases_quantity cc.total_purchases[:quantity]
                json.purchases_unit_cost to_peso(cc.total_purchases[:unit_cost])
                json.purchases_amount to_peso(cc.total_purchases[:amount])
                json.purchases_percentage "#{cc.total_purchases[:percentage]} %"
                json.ending_quantity cc.ending_inventory[:quantity]
                json.ending_unit_cost to_peso(cc.ending_inventory[:unit_cost])
                json.ending_amount to_peso(cc.ending_inventory[:amount])
                json.cogs_qty cc.cogs[:quantity]
                json.cogs_unit_cost to_peso(cc.cogs[:unit_cost])
                json.cogs_amount to_peso(cc.cogs[:amount])
                json.cogs_percentage "#{cc.cogs[:percentage]} %"
            end
        end
    end
end