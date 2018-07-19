

json.chart do |chart|
    json.caption "Sales vs Expenses"
    json.subcaption "Today #{Date.today.strftime("%A %B %d, %Y")}"
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
expense = { label: "Expense", value: @expenses }
sales = { label: "Sales", value: @sales }
data = [expense,sales]
json.data data

