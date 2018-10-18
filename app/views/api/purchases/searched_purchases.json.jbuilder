
json.next_page @purchases.next_page if @purchases.present?
json.purchases do |json|
    json.array! @purchases do |purchase|
        if purchase.purchase_items.present?
            pis = @items.present? ? purchase.purchase_items.where(item_id: @items) : purchase.purchase_items
            json.id purchase.id
            json.branch purchase.branch
            json.supplier purchase.supplier
            json.purchase_date purchase.purchase_date.strftime("%m/%d/%Y")
            json.invoice_number purchase.invoice_number
            json.creator User.find_by(id: purchase.user_created_by_id)
            json.editor User.find_by(id: purchase.user_modified_by_id)
            json.purchase_items pis do |pi|
                json.item pi.item
                json.category pi.item.category.name
                json.quantity pi.quantity
                json.unit_cost pi.purchase_item_amount
                json.item_total_vat to_peso(pi.item_total_vat)
                json.item_total_net to_peso(pi.item_total_net)
                json.item_total_amount to_peso(pi.item_total_amount)
            end
            
        end
    end
end
json.total_vat to_peso(@all_purchases.map { |purchase| @items.present? ? purchase.purchase_items.where(item_id: @items).map(&:item_total_vat).sum : purchase.purchase_items.map(&:item_total_vat).sum }.sum )
json.total_amount to_peso(@all_purchases.map { |purchase| @items.present? ? purchase.purchase_items.where(item_id: @items).map(&:item_total_amount).sum : purchase.purchase_items.map(&:item_total_amount).sum }.sum )
json.total_net to_peso(@all_purchases.map { |purchase| @items.present? ? purchase.purchase_items.where(item_id: @items).map(&:item_total_net).sum : purchase.purchase_items.map(&:item_total_net).sum }.sum )
