json.month Date.today.year

json.this_week_revenues_total to_peso(@object.this_week_revenues[:total])
json.this_week_revenues_ave to_peso(@object.this_week_revenues[:average])

json.this_month_revenues_total to_peso(@object.this_month_revenues[:total])
json.this_month_revenues_ave to_peso(@object.this_month_revenues[:average])

json.this_year_revenues_total to_peso(@object.this_year_revenues[:total])
json.this_year_revenues_ave to_peso(@object.this_year_revenues[:average])


