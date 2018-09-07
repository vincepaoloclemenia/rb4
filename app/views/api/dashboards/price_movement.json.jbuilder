chart = {
    "yaxisname": "Item Cost",
    "anchorradius": "5",
    "plottooltext": "Average cost for the month of $label is <b>$dataValue</b>",
    "showhovereffect": "1",
    "showvalues": "0",
    "theme": "ocean",
    "anchorbgcolor": "#1D75A1",
    "palettecolors": "#1D75A1",
    "numberprefix": "#{get_currency(current_brand.currency || 'php')}"
}

json.chart chart

data = Date::MONTHNAMES.reject { |m| m.nil? || m.to_date > Date.today }.map do |month|
            { label: month.to_date.strftime("%b"), value: @object.get_total_per_month(@item, month.to_date)[:average] }
        end

json.data data