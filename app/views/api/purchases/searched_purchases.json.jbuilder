json.next_page @purchases.next_page
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
            json.item_total_vat to_peso(pi.item_total_vat)
            json.item_total_net to_peso(pi.item_total_net)
            json.item_total_amount to_peso(pi.item_total_amount)
        end
        json.total_vat to_peso(purchase.purchase_items.map(&:item_total_vat).sum)
        json.total_amount to_peso(purchase.purchase_items.map(&:item_total_amount).sum)
        json.total_net to_peso(purchase.purchase_items.map(&:item_total_net).sum)
    end
end