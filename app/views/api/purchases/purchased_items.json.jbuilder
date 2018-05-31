json.next_page @purchases.next_page if @purchases.present?
json.purchases do |json|
    json.array! @purchases do |purchase|
        json.id purchase.id
        json.branch_name purchase.branch.name
        json.unable_to_modify purchase.unable_to_modify?
        json.supplier_name purchase.supplier.name
        json.purchase_date purchase.purchase_date.strftime("%m/%d/%Y")
        json.invoice_number purchase.invoice_number
        json.creator User.find_by(id: purchase.user_created_by_id)
        json.editor User.find_by(id: purchase.user_modified_by_id)
        json.total_vat to_peso(purchase.overall_vat)
        json.total_amount to_peso(purchase.overall_amount)
        json.total_net to_peso(purchase.overall_net)
    end
end

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