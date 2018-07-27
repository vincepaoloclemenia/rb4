class ComputeCost
    attr_reader :branch, :item, :selected_range, :from, :to, :total_sales, :purchase_items_for_beg_inv, :inventories_for_beg_inv, :purchase_items, :inventory_items
    def initialize( branch, item, date_range, selected_range )
        @branch = branch
        @item = item
        @selected_range = selected_range
        @from = date_range.split(" - ")[0].to_date
        @to = date_range.split(" - ")[1].to_date
        @total_sales = branch.sales.where(sale_date: from..to).map(&:net_total_sales).sum.round(2)
        @item = item
        @purchase_items_for_beg_inv = branch.purchase_items.includes(:purchase).where( item_id: item, purchases: { purchase_date: range } )
        @inventories_for_beg_inv = branch.inventory_items.includes(:inventory).where( item_id: item, inventories: { entry_date: range } )
        @purchase_items = branch.purchase_items.includes(:purchase).where( item_id: item, purchases: { purchase_date: from..to } )
        @inventory_items = branch.inventory_items.includes(:inventory).where( item_id: item, inventories: { entry_date: from..to } )
    end

    def compute_cost
        #beginning_inventory variables
        bi_quantity = inventories_for_beg_inv.map(&:stock_count).sum.round(2)
        purchase_quantity = purchase_items_for_beg_inv.map(&:quantity).sum.round(2)
        purchased_items_amount = purchase_items_for_beg_inv.map(&:item_total_net).sum.round(2)
        bi_unit_cost = purchased_items_amount <= 0 || purchase_quantity <= 0 ? 0 : (purchased_items_amount / purchase_quantity).round(2)
        bi_amount = bi_unit_cost * bi_quantity
        
        #total_purchases variables
        tp_quantity = purchase_items.map(&:quantity).sum.round(2)
        tp_amount = purchase_items.map(&:item_total_net).sum.round(2)
        tp_unit_cost = tp_quantity <= 0 || tp_amount <= 0 ? 0 : (tp_amount / tp_quantity).round(2)
        tp_percentage = tp_amount <= 0 || total_sales <= 0 ? 0 : ( tp_amount / total_sales ) * 100

        #ending_inventory variables
        ei_quantity = inventory_items.map(&:stock_count).sum.round(2)
            bg_and_tp_amount = bi_amount + tp_amount
            bg_and_tp_quantity = bi_quantity + tp_quantity
        ei_unit_cost = bg_and_tp_amount <= 0 || bg_and_tp_quantity <= 0 ? 0 : (bg_and_tp_amount / bg_and_tp_quantity).round(2)
        ei_amount = (ei_quantity * ei_unit_cost).round(2)

        #cogs variables
        cogs_quantity = bi_quantity + tp_quantity - ei_quantity
        cogs_amount = bi_amount + tp_amount - ei_amount
        cogs_unit_cost = cogs_amount <= 0 || cogs_quantity <= 0 ? 0 : (cogs_amount / cogs_quantity).round(2)
        cogs_percentage = cogs_amount <= 0 || total_sales <= 0 ? 0 : (cogs_amount / total_sales) * 100
        return { 
            bi_quantity: bi_quantity % 1 == 0 ? bi_quantity.to_i : bi_quantity, 
            bi_unit_cost: bi_unit_cost, 
            bi_amount: bi_amount, 
            tp_quantity: tp_quantity % 1 == 0 ? tp_quantity.to_i : tp_quantity,
            tp_amount: tp_amount,
            tp_unit_cost: tp_unit_cost,
            tp_percentage: tp_percentage.round(2),
            ei_amount: ei_amount,
            ei_quantity: ei_quantity % 1 == 0 ? ei_quantity.to_i : ei_quantity,
            ei_unit_cost: ei_unit_cost,
            cogs_quantity: cogs_quantity % 1 == 0 ? cogs_quantity.to_i : cogs_quantity,
            cogs_amount: cogs_amount,
            cogs_unit_cost: cogs_unit_cost,
            cogs_percentage: cogs_percentage.round(2)
        }
    end

    def range
        selected_range == "week" ? last_week_range : last_month_range
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