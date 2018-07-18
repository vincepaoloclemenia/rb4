json.chart do |chart|
    json.caption "Sales vs Expenses"
    json.subcaption "This week ( #{Date.today.beginning_of_week.strftime('%b %d, %Y')} - #{Date.today.end_of_week.strftime('%b %d, %Y')} )"
    json.xaxisname "#{Date.today.beginning_of_week.strftime('%b %d')} - #{Date.today.end_of_week.strftime('%b %d')}"
    json.yaxisname "Amount"
    json.numberprefix "₱"
    json.theme "ocean"
end

day_category = [
    Date.today.all_week.map{ |d| { "label": d.strftime("%a")} }
]

sales= {
    "seriesname": "Sales",
    "data": @sales,
}
expenses = {
    "seriesname": "Expenses",
    "renderas": "line",
    "showvalues": "0",
    "data": @expenses
}

dataset = [ sales, expenses ]

categories = [
    { category: day_category }
]



json.categories categories
json.dataset dataset