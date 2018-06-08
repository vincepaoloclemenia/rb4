if params[:date].present? || params[:branch].present? || branch_admin?
    json.purchase_orders do |json|
        json.array! @purchase_orders.keys do |supplier|
            json.supplier supplier.name
            json.purchase_order_items @purchase_orders[supplier] do |po|
                json.user po.purchase_order.user
                json.branch po.purchase_order.branch
                json.brand po.purchase_order.brand
                json.pr_number po.purchase_order.pr_number
                json.po_number po.purchase_order.po_number
                json.pr_date po.purchase_order.pr_date.strftime("%b %d, %Y")
                json.po_date po.purchase_order.po_date.strftime("%b %d, %Y")
                json.remarks po.purchase_order.remarks
                json.status po.purchase_order.status
                json.sent po.purchase_order.sent
                json.date_sent po.purchase_order.date_sent
                json.item po.item.name
                json.quantity po.quantity % 1 == 0 ? po.quantity.to_i : po.quantity
                json.unit po.unit.name
                json.packaging po.packaging
                json.item_brand po.item_brand
                json.total to_peso(po.total_amount)
                json.unit_price to_peso(po.price_selected)
            end
            json.over_all to_peso(@purchase_orders[supplier].map(&:total_amount).sum)
        end
    end
end

json.branches @branches
json.date_range @date_range