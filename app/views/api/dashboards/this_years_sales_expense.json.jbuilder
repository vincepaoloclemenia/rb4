json.chart do |chart|
    json.caption "Sales vs Expenses"
    json.subcaption "#{Date.today.strftime('%Y')}'s Monthly Report"
    json.xaxisname "January - December"
    json.yaxisname "Amount"
    json.numberprefix "₱ "
    json.theme "ocean"
end

month_category = [
    Date::MONTHNAMES.reject { |m| m.nil? || m.to_date > Date.today }.map { |m| { "label": m.to_date.strftime("%b") } }
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
    { category: month_category }
]



json.categories categories
json.dataset dataset