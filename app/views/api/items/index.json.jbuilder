json.next_page @items.next_page
json.items do |json|
    json.array! @items do |item|
        json.id item.id
        json.name item.name
        json.unit item.unit.name
        json.category item.category.name
        json.item_type item.item_type
        json.track_as_sales item.track_as_sales ? "Yes" : "No" 
        json.active item.is_active
    end
end

json.brand_items do |json|
    json.array! @brand_items.each_with_index.to_a do |item, index|
        json.label item.name
        json.input item.id
        json.value index
    end
end