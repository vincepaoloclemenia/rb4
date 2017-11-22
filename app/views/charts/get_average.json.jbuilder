json.from @from
json.to @to
json.colours @colours
json.branches do |json|
    json.array! @branches do |branch|
        json.id branch.id
        json.name branch.name
        json.average branch.sales.invalid_sales? ? branch.average_sales(@from, @to) : to_peso(branch.average_sales(@from, @to))
        json.reverse branch.name.downcase.reverse.gsub(/[' ()#]/, '')
        json.status case sales_status(branch, @from, @to)
                    when "NA" then "NA"
                    when "Good" then "Good"
                    when "Unwell" then "Unwell"
                    end
    end
end