json.purchase_orders do |json|
    json.array! @purchase_orders do |po|
        json.id po.id
        json.user po.user
        json.branch po.branch
        json.brand po.brand
        json.pr_number po.pr_number
        json.po_number po.po_number
        json.pr_date po.pr_date
        json.po_date po.po_date
        json.remarks po.remarks
        json.terms po.terms
        json.status po.status
        json.supplier po.supplier
        json.po_items po.purchase_order_items do |poi|
            json.item poi.item
            json.quantity poi.quantity
            json.packaging poi.packaging
            json.price_selected to_peso(poi.price_selected)
            json.total_price to_peso(poi.total_amount)
        end
        json.total_price to_peso(po.total_amount)
        json.total_amount to_peso(po.total_amount)
    end
end

json.branches do |json|
    json.array! @branches.each_with_index.to_a do |(job, index)|
        json.label job
        json.value index
    end
end

json.suppliers do |json|
    json.array! @suppliers.each_with_index.to_a do |(supp, index)|
        json.label supp
        json.value index
    end
end

json.items @items