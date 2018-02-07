json.rejected_pos do |json|
    json.array! @rejected_pos do |po|
        json.id po.id
        json.user po.user
        json.branch po.branch
        json.brand po.brand
        json.pr_number po.pr_number
        json.po_number po.po_number
        json.pr_date po.pr_date.nil? ? po.pr_date : time_ago_in_words(po.pr_date) + " ago"
        json.po_date po.po_date.nil? ? po.po_date : time_ago_in_words(po.po_date) + " ago"
        json.remarks po.remarks
        json.terms po.terms
        json.status po.status
        json.supplier po.supplier
    end
end