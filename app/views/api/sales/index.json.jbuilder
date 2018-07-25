json.next_page @sales.next_page if @sales.present?
json.sales do |json|
    json.array! @sales do |sale|
        json.id sale.id
        json.date to_default_date_format(sale.sale_date)
        json.branch sale.branch.name
        json.net to_peso(sale.net_sales)
        json.vat to_peso(sale.vat)
        json.settlement to_peso(sale.total_settlement_sales)
        json.deposits to_peso(sale.cash_in_drawer)
    end 
end

unless branch_admin?
    json.branches @branches
    if @date_range.present?
        json.chart do |chart|
            json.caption "Sales of this year's (#{Date.today.year}) and last year's (#{Date.today.last_year.year}) "
            json.subcaption "Sales Comparison"
            json.xaxisname "#{@from.strftime('%b %d')} - #{@to.strftime('%b %d')}"
            json.yaxisname "Net total sales per day"
            json.numberprefix "₱ "
            json.theme "fint"
        end
        
        day_category = [
            @date_range.map { |day| { label: day.strftime("%b %d")}}
        ]
        this_years_sales = {
            "seriesname": "This year's sales",
            "data": @sales_with_data
        }
        last_year_sales = {
            "seriesname": "Last year's sales",
            "renderas": "area",
            "showvalues": "0",
            "data": @sales_last_year
        }

        categories = [ category: day_category ]
        data = [this_years_sales, last_year_sales] 

        json.categories categories
        json.dataset data
    end
end