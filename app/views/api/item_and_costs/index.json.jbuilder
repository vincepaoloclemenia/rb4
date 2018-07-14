json.all_items do |json|
    json.array! @items.keys.each do |category|
        json.category category
        subcategories = @items[category].group_by { |x| x.category.name }
        json.subcats subcategories.keys.each do |subcat|
            json.subcategory subcat
            bi_total_amount = 0
            tp_total_amount = 0
            tp_total_percentage = 0
            ei_total_amount = 0
            cogs_total_amount = 0
            cogs_total_percentage = 0
            json.items subcategories[subcat] do |item|
                cc = ComputeCost.new(@branch, item.id, @dr, "month")
                bi_amount = cc.compute_cost[:bi_amount]
                tp_amount = cc.compute_cost[:tp_amount]
                tp_percentage = cc.compute_cost[:tp_percentage]
                ei_amount = cc.compute_cost[:ei_amount]
                cogs_amount = cc.compute_cost[:cogs_amount]
                cogs_percentage = cc.compute_cost[:cogs_percentage]
                json.name item.name
                json.unit item.unit.name
                json.bi_quantity cc.compute_cost[:bi_quantity]
                json.bi_amount to_peso(bi_amount)
                json.bi_unit_cost to_peso(cc.compute_cost[:bi_unit_cost])
                json.tp_quantity cc.compute_cost[:tp_quantity]
                json.tp_amount to_peso(tp_amount)
                json.tp_unit_cost to_peso(cc.compute_cost[:tp_unit_cost])
                json.tp_percentage tp_percentage
                json.ei_amount to_peso(ei_amount)
                json.ei_quantity cc.compute_cost[:ei_quantity]
                json.ei_unit_cost to_peso(cc.compute_cost[:ei_unit_cost])
                json.cogs_quantity cc.compute_cost[:cogs_quantity]
                json.cogs_amount to_peso(cogs_amount)
                json.cogs_unit_cost to_peso(cc.compute_cost[:cogs_unit_cost])
                json.cogs_percentage cogs_percentage
                bi_total_amount += bi_amount
                tp_total_amount += tp_amount
                tp_total_percentage += tp_percentage
                ei_total_amount = ei_amount
                cogs_total_amount = cogs_amount
                cogs_total_percentage = cogs_percentage
            end
            json.bi_total_amount bi_total_amount
            json.tp_total_amount tp_total_amount
            json.tp_total_percentage tp_total_percentage
            json.ei_total_amount ei_total_amount
            json.cogs_total_amount cogs_total_amount
            json.cogs_total_percentage cogs_total_percentage
        end
    end
end