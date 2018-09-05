json.this_years_sales_total to_peso(@object.this_year_sales[:total])
json.highest_sale to_peso(@object.sales.highest_sales.present? ? @object.sales.highest_sales.net_total_sales : 0.0)
json.lowest_sale to_peso(@object.sales.lowest_sales.present? ? @object.sales.lowest_sales.net_total_sales : 0.0)
json.highest_sale_date @object.sales.highest_sales.present? ? @object.sales.highest_sales.sale_date.strftime("%B %d, %Y") : "No record found"
json.lowest_sale_date @object.sales.lowest_sales.present? ?  @object.sales.lowest_sales.sale_date.strftime("%B %d, %Y") : "No record found"