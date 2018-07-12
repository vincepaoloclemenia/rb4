class ComputeCost
    attr_reader :branch, :item_id, :selected_range, :from, :to
    def initialize( branch, item_id, date_range, selected_range )
        @branch = branch
        @item_id = item_id
        @selected_range = selected_range
        @from = date_range.split(" - ")[0].to_date
        @to = date_range.split(" - ")[1].to_date
    end

    def beginning_inventory
        quantity = inventory_items(range).map(&:stock_count).sum.round(2)
        amount = purchase_items(range).map(&:item_total_net).sum.round(2)
        unit_cost = quantity <= 0 || amount <= 0 ? 0 : (amount / quantity).round(2)
        return { quantity: quantity % 1 == 0 ? quantity.to_i : quantity, unit_cost: unit_cost, amount: amount }
    end

    def total_purchases
        quantity = purchase_items(specified_range).map(&:quantity).sum.round(2)
        amount = purchase_items(specified_range).map(&:item_total_net).sum.round(2)
        unit_cost = quantity <= 0 || amount <= 0 ? 0 : (amount / quantity).round(2)
        percentage = amount <= 0 || total_sales < 0 ? 0 : amount / sales.map(&:net_total_sales).sum.round(2)
        return { quantity: quantity % 1 == 0 ? quantity.to_i : quantity, unit_cost: unit_cost, amount: amount, percentage: percentage.round(2) }
    end

    def ending_inventory
        quantity = inventory_items(specified_range).map(&:stock_count).sum.round(2)
        beg_and_total_amount = (beginning_inventory[:amount] + total_purchases[:amount])
        beg_and_total_quantity = (beginning_inventory[:quantity] + total_purchases[:quantity])
        unit_cost = if beg_and_total_amount <= 0 || beg_and_total_quantity <= 0
                        0
                    else
                        beg_and_total_amount / beg_and_total_quantity
                    end
        amount = quantity * unit_cost
        return { quantity: quantity % 1 == 0 ? quantity.to_i : quantity, unit_cost: unit_cost, amount: amount }        
    end

    def cogs
        quantity = beginning_inventory[:quantity] + total_purchases[:quantity] - ending_inventory[:quantity]
        amount = beginning_inventory[:amount] + total_purchases[:amount] - ending_inventory[:amount]
        unit_cost = amount <= 0 || quantity <= 0 ? 0 : amount / quantity
        percentage = quantity <= 0 ? 0 : quantity / sales.map(&:net_total_sales).sum.round(2)
        return { quantity: quantity % 1 == 0 ? quantity.to_i : quantity, unit_cost: unit_cost, amount: amount, percentage: percentage.round(2) }        
    end

    def range
        selected_range == "week" ? last_week_range : last_month_range
    end

    def purchase_items(d_range)
        branch.purchase_items.includes(:purchase).where( item_id: item_id, purchases: { purchase_date: d_range })        
    end

    def inventory_items(d_range)
       branch.inventory_items.includes(:inventory).where(item_id: item_id, inventories: { entry_date: d_range } )        
    end

    def sales
        branch.sales.where(sale_date: specified_range)
    end

    def total_sales
        sales.map(&:net_total_sales).sum.round(2)
    end

    def specified_range
        from..to
    end

    def last_week_range
        (from - 7).all_week
    end

    def last_month_range
        from.last_month.all_month
    end

end