
if @items.present?
    json.purchases do |json|
        json.array! @purchases do |purchase|
            if purchase.purchase_items.present?
                json.id purchase.id
                json.branch purchase.branch
                json.supplier purchase.supplier
                json.purchase_date purchase.purchase_date.strftime("%m/%d/%Y")
                json.invoice_number purchase.invoice_number
                json.creator User.find_by(id: purchase.user_created_by_id)
                json.editor User.find_by(id: purchase.user_modified_by_id)
                json.purchase_items purchase.purchase_items.search_item(@items) do |pi|
                    json.item pi.item
                    json.category pi.item.category.name
                    json.item_total_vat to_peso(pi.item_total_vat)
                    json.item_total_net to_peso(pi.item_total_net)
                    json.item_total_amount to_peso(pi.item_total_amount)
                end
                
            end
        end
    end
    json.total_vat to_peso(@purchases.map { |purchase| purchase.purchase_items.search_item(@items).map(&:item_total_vat).sum }.sum )
    json.total_amount to_peso(@purchases.map { |purchase| purchase.purchase_items.search_item(@items).map(&:item_total_amount).sum }.sum )
    json.total_net to_peso(@purchases.map { |purchase| purchase.purchase_items.search_item(@items).map(&:item_total_net).sum }.sum )
else
    json.purchases do |json|
        json.array! @purchases do |purchase|
            if purchase.purchase_items.present?
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
                json.total_vat to_peso(purchase.purchase_items.map(&:item_total_vat).sum) if @purchases.present?
                json.total_amount to_peso(purchase.purchase_items.map(&:item_total_amount).sum) if @purchases.present?
                json.total_net to_peso(purchase.purchase_items.map(&:item_total_net).sum) if @purchases.present?
            end
        end
    end
    json.total_vat to_peso(@purchases.map { |purchase| purchase.purchase_items.map(&:item_total_vat).sum }.sum )
    json.total_amount to_peso(@purchases.map { |purchase| purchase.purchase_items.map(&:item_total_amount).sum }.sum )
    json.total_net to_peso(@purchases.map { |purchase| purchase.purchase_items.map(&:item_total_net).sum }.sum )    
end