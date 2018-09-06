chart = {
    "caption": "Branches Ranking Accoring to their Sales as of (#{Date.today.strftime('%B %d, %Y')})",
    "yaxisname": "Sales",
    "aligncaptionwithcanvas": "0",
    "plottooltext": "Total of <b>$dataValue</b> this year",
    "theme": "ocean",
    "numberprefix": "#{get_currency(current_brand.currency || 'php')}"
}

json.chart chart

data = current_branches.sort_by{ |b| b.this_year_sales[:total] }.reverse.map do |branch|
        { label: branch.name, color: branch.color, value: branch.this_year_sales[:total] }
    end

json.data data