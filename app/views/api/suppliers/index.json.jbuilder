json.suppliers do |json|
  json.array! @suppliers do |supplier|
    json.id supplier.id
    json.name supplier.name
    json.price supplier.contact_person
  end
end