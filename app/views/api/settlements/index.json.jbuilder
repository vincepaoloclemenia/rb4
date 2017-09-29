json.next_page @settlements.next_page
json.settlements do |json|
    json.array! @settlements do |settlement|
        json.id settlement.id
        json.name settlement.name
        json.description settlement.description
        json.is_complimentary settlement.is_complimentary
        json.is_active settlement.is_active
    end
end




