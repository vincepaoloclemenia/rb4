json.ave_revenues to_peso(@average_revenues)
json.last_week_revenues to_peso(@last_week_revenues)
json.percentage @last_week_revenues == 0 && @average_revenues == 0 ? 0 : (( @last_week_revenues - @average_revenues ) * 100 / @average_revenues ).to_i