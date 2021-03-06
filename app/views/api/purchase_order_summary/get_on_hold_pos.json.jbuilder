json.next_page @on_hold_pos.next_page
json.on_hold_pos do |json|
    json.array! @on_hold_pos do |po|
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
    end
end