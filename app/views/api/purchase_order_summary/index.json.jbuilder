json.next_page @approved_purchase_orders.next_page
json.approved_purchase_orders do |json|
    json.array! @approved_purchase_orders do |po|
        json.id po.id
        json.date_sent po.date_sent? ? po.date_sent.strftime("%b %d, %Y | %l:%M %p") : "Unsent"
        json.sent po.sent
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
    end
end

