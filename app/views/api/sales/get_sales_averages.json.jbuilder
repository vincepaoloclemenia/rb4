json.sales_average to_peso(@average_sales)
json.last_week_sales to_peso(@last_week_ave_sales)
json.percentage @average_sales == 0 && @last_week_ave_sales == 0 ? 0 : ((@last_week_ave_sales - @average_sales) * 100 / @average_sales).to_i
