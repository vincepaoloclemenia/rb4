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
        json.total_amount to_peso(po.total_amount)
    end
end