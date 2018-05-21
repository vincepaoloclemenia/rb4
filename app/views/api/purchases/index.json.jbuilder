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

json.categories do |json|
    json.array! @categories.each_with_index.to_a do |category, index|
        json.label category.name
        json.input category.id
        json.value index
    end
end

json.items do |json|
    json.array! @items.each_with_index.to_a do |item, index|
        json.label item.name
        json.value index
        json.input item.id
    end
end

json.next_page @purchases.next_page if @purchases.present?

json.purchases do |json|
    json.array! @purchases do |purchase|
        json.id purchase.id
        json.branch purchase.branch
        json.supplier purchase.supplier
        json.purchase_date purchase.purchase_date.strftime("%m/%d/%Y")
        json.invoice_number purchase.invoice_number
        json.creator User.find_by(id: purchase.user_created_by_id)
        json.editor User.find_by(id: purchase.user_modified_by_id)
        json.purchase_items purchase.purchase_items do |pi|
            json.item pi.item
            json.category pi.item.category.name
            json.quantity pi.quantity
            json.unit_cost pi.purchase_item_amount
            json.item_total_vat to_peso(pi.item_total_vat)
            json.item_total_net to_peso(pi.item_total_net)
            json.item_total_amount to_peso(pi.item_total_amount)
        end
        json.total_vat to_peso(purchase.purchase_items.map(&:item_total_vat).sum)
        json.total_amount to_peso(purchase.purchase_items.map(&:item_total_amount).sum)
        json.total_net to_peso(purchase.purchase_items.map(&:item_total_net).sum)
    end
end