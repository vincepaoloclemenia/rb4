json.chart do |chart|
    json.caption "Sales Comparison for #{Date.today.year}"
    json.subcaption "#{Date.today.last_year.beginning_of_year.strftime('%B %d, %Y')} - #{Date.today.strftime('%B %d, %Y')}"
    json.xaxisname "Monthly Data Representation of Sales (year #{Date.today.year})"
    json.yaxisname "Net total sales per month"
    json.numberprefix "₱ "
    json.theme "ocean"
end


month_category = [
    Date::MONTHNAMES.reject { |m| m.nil? || m.to_date > Date.today }.map { |m| { "label": m.to_date.strftime("%b") } }
]

this_year_sales = {
    "seriesname": "#{Date.today.year}'s sales",
    "data": @sales_this_year,
}
last_year_sales = {
    "seriesname": "#{Date.today.last_year.year}'s sales",
    "renderas": "area",
    "showvalues": "0",
    "data": @sales_last_year
}

dataset = [ this_year_sales, last_year_sales ]

categories = [
    { category: month_category }
]

json.categories categories
json.dataset dataset

total_this_year = @sales_this_year.map { |s| s[:value] }.sum
total_last_year = @sales_last_year.map { |s| s[:value] }.sum

json.piechart do |chart|
    json.caption "#{Date.today.last_year.year}'s vs #{Date.today.year}'s Sales (Percentage)"
    json.subcaption "Sales Comparison"
    json.startingangle "120"
    json.showlabels "0"
    json.showlegend "1"
    json.enablemultislicing "0"
    json.slicingdistance "15"
    json.showpercentvalues "1"
    json.showpercentintooltip "0"
    json.plottooltext "$label: ₱ $datavalue"
    json.theme "ocean"
end
this_year = { label: "This year's sales", value: total_this_year }
last_year = { label: "Last year's sales", value: total_last_year }
data = [this_year, last_year]
json.data data