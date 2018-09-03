json.chart do
    json.caption "Monthly Sales Average as of"
    json.subCaption "#{Date.today.year}"
    json.xAxisName "#{Date.today.beginning_of_year.strftime('%B')} - #{Date.today.strftime('%B')}"
    json.yAxisName "Sales Average"
    json.lineThickness "2"
    json.paletteColors "#0075c2"
    json.baseFontColor "#333333"
    json.captionFontSize "13"
    json.subcaptionFontSize "12"
    json.subcaptionFontBold "0"
    json.showBorder "0"
    json.bgColor "#ffffff"
    json.showShadow "0"
    json.canvasBgColor "#ffffff"
    json.canvasBorderAlpha "0"
    json.divlineAlpha "100"
    json.divlineColor "#999999"
    json.divlineThickness "1"
    json.divLineDashed "1"
    json.divLineDashLen "1"
    json.showXAxisLine "1"
    json.xAxisLineThickness "1"
    json.xAxisLineColor "#999999"
    json.showAlternateHGridColor "0"
end

sales_data = Date::MONTHNAMES.reject { |m| m.nil? || m.to_date > Date.today }.map do |month|
                sales = @object.sales.get_month_sales_ave(month)
                { label: month, value: sales }
            end

json.data sales_data

trend_lines = [
                {
                    "line": [
                        {
                            "startvalue": @object.this_year_sales[:average].round(2),
                            "color": "#B68B09",
                            "displayvalue": "Daily{br}Sales{br}Average{br}for #{Date.today.year}",
                            "valueOnRight": "1",
                            "thickness": "2"
                        }
                    ]
                }
            ]

json.trendlines trend_lines