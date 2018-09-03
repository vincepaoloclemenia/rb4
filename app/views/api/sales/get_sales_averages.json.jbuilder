json.month Date.today.year

json.this_week_sales_total to_peso(@object.this_week_sales[:total])
json.this_week_sales_ave to_peso(@object.this_week_sales[:average])

json.this_month_sales_total to_peso(@object.this_month_sales[:total])
json.this_month_sales_ave to_peso(@object.this_month_sales[:average])

json.this_year_sales_total to_peso(@object.this_year_sales[:total])
json.this_year_sales_ave to_peso(@object.this_year_sales[:average])

week = (@object.this_week_sales[:average] - @object.this_year_sales[:average]) / @object.this_year_sales[:average]
month = (@object.this_month_sales[:average] - @object.this_year_sales[:average]) / @object.this_year_sales[:average]

json.week_percentage (week * 100).round(2)
json.month_percentage (month * 100).round(2)