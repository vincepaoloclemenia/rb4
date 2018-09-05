lowest_count = @object.sales_non_misces.present? ? @object.sales_non_misces.lowest_count : 0.0
highest_count = @object.sales_non_misces.present? ? @object.sales_non_misces.highest_count.to_f : 0.0
month_count_average = @object.sales_non_misces.present? ? @object.sales_non_misces.this_month_count[:average] : 0.0
year_average_count = @object.sales_non_misces.present? ? @object.sales_non_misces.this_year_count[:average] : 0.0
chart = {
    "caption": "This Week's Customer Average (#{Date.today.beginning_of_week.strftime('%b %d')} - #{Date.today.strftime('%b %d')})",
    "subcaption": "#{Date.today.year}",
    "lowerlimit": "0",
    "upperlimit": highest_count,
    "showvalue": "1",
    "theme": "ocean"
}
json.chart chart

colorrange = {
    "color": [
    {
        "minvalue": "0",
        "maxvalue": lowest_count,
        "code": "#86D9FF"
    },
    {
        "minvalue": lowest_count,
        "maxvalue": month_count_average,
        "code": "#1D75A1"
    },
    {
        "minvalue": month_count_average,
        "maxvalue": highest_count,
        "code": "#225A79",
    }
    ]
}
json.colorrange colorrange

dials = {
    "dial": [
        {
            "value": @object.sales_non_misces.this_week_count[:average],
            "tooltext": "This Week's Average",
            "color": "#29A5DF"
        }
    ]
}
json.dials dials

trendpoints = {
    "point": [
        {
            "startvalue": year_average_count,
            "displayvalue": "Daily Customer Count Average",
            "thickness": "2",
            "color": "#E15A26",
            "usemarker": "1",
            "markerbordercolor": "#E15A26",
            "markertooltext": year_average_count
        }
    ]
}
json.trendpoints trendpoints