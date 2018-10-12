json.suppliers do |json|
    json.array! @suppliers.each_with_index.to_a do |supp, index|
        json.label supp.name
        json.input supp.id
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


json.next_page @purchases.next_page if @purchases.present?
json.purchases do |json|
    json.array! @purchases do |purchase|
        json.id purchase.id
        json.invoice_number purchase.invoice_number
        json.invoice_date purchase.purchase_date.strftime("%b %d, %Y")
        json.entry_date purchase.created_at.strftime("%b %d, %Y | %l:%M %P")
        json.branch purchase.branch.name
        json.supplier purchase.supplier.name
        json.vat_amount to_peso(purchase.overall_vat)
        json.total_amount to_peso(purchase.overall_amount)
        json.net_amount to_peso(purchase.overall_net)
        json.created_by purchase.created_by.full_name
    end
end
