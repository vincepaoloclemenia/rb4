json.next_page @purchase_orders.next_page
json.purchase_orders do |json|
    json.array! @purchase_orders do |po|
        json.id po.id
        json.user po.user
        json.branch po.branch.name
        json.brand po.brand
        json.pr_number po.pr_number
        json.po_number po.po_number
        json.pr_date po.pr_date
        json.po_date po.po_date
        json.remarks po.remarks
        json.terms po.terms
        json.status po.status
        json.supplier po.supplier.name
        json.allowed_to_delete branch_admin? && !po.sent?
        json.sent po.sent
        json.date_sent po.date_sent.present? ? time_ago_in_words(po.date_sent) + " ago" : "Unsent"
    end
end