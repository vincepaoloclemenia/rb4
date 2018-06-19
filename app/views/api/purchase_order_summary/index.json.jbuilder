json.next_page @approved_purchase_orders.next_page
json.approved_purchase_orders do |json|
    json.array! @approved_purchase_orders do |po|
        json.id po.id
        json.date_sent po.date_sent? ? po.date_sent.strftime("%b %d, %Y | %l:%M %p") : "Unsent"
        json.sent po.sent
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
        json.client_and_sent client_admin? || !po.sent
        json.date_sent po.date_sent.present? ? time_ago_in_words(po.date_sent) + " ago" : "Unsent"
    end
end

json.suppliers do |json|
    json.array! @suppliers.each_with_index.to_a do |sup, index|
        json.label sup.name
        json.input sup.id
        json.value index
    end
end

json.branches do |json|
    json.array! @branches.each_with_index.to_a do |branch, index|
        json.label branch.name
        json.input branch.id
        json.value index
    end
end

