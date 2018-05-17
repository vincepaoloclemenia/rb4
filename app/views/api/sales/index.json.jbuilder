json.next_page @sales.next_page
json.sales do |json|
    json.array! @sales do |sale|
        json.id sale.id
        json.date to_default_date_format(sale.sale_date)
        json.branch sale.branch.name
        json.net to_peso(sale.net_sales)
        json.vat to_peso(sale.vat)
        json.settlement to_peso(sale.total_settlement_sales)
        json.deposits to_peso(sale.cash_in_drawer)
    end 
end