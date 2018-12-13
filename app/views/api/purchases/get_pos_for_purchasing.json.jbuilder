json.array! @purchase_orders do |po|
    json.po_number po.po_number
    json.id po.id
    json.supplier_name po.supplier.name
end