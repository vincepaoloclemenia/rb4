json.month Date.today.year

json.this_week_sales_total to_peso(@object.this_week_sales[:total])
json.this_week_sales_ave to_peso(@object.this_week_sales[:average])

json.this_month_sales_total to_peso(@object.this_month_sales[:total])
json.this_month_sales_ave to_peso(@object.this_month_sales[:average])

json.this_year_sales_total to_peso(@object.this_year_sales[:total])
json.this_year_sales_ave to_peso(@object.this_year_sales[:average])


