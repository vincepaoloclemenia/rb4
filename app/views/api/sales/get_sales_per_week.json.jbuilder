json.chart do |chart|
    json.caption "Sales Comparison between Last Week's and This Week's"
    json.subcaption "Last Week's vs This Week's"
    json.xaxisname "#{Date.today.last_week.beginning_of_week.strftime('%b %d, %Y')} - #{Date.today.end_of_week.strftime('%b %d, %Y')}"
    json.yaxisname "Net total sales per day"
    json.numberprefix "₱ "
    json.theme "ocean"
end

day_category = [
    Date.today.all_week.map{ |d| { "label": d.strftime("%a")} }
]

sales_this_week= {
    "seriesname": "This week's sales",
    "data": @sales_this_week,
}

sales_last_week = {
    "seriesname": "Last week's sales",
    "renderas": "area",
    "showvalues": "0",
    "data": @sales_last_week
}

dataset = [ sales_this_week, sales_last_week ]

categories = [
    { category: day_category }
]

json.categories categories
json.dataset dataset

total_this_week = @sales_this_week.map { |s| s[:value] }.sum
total_last_week = @sales_last_week.map { |s| s[:value] }.sum

json.piechart do |chart|
    json.caption "Last Week's vs This Week's (Percentage)"
    json.subcaption "#{Date.today.last_week.beginning_of_week.strftime('%b %d, %Y')} - #{Date.today.end_of_week.strftime('%b %d, %Y')}"
    json.startingangle "120"
    json.showlabels "0"
    json.showlegend "1"
    json.enablemultislicing "0"
    json.slicingdistance "15"
    json.showpercentvalues "1"
    json.showpercentintooltip "0"
    json.plottooltext "$label: ₱ $datavalue"
    json.theme "fint"
end
this_week = { label: "This week's sales percentage", value: total_this_week }
last_week = { label: "Last week's sales percentage", value: total_last_week }
data = [this_week, last_week]
json.data data