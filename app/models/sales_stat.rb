class SalesStat < ActiveRecord::Base
    belongs_to :sale
    belongs_to :statistic
    has_one :branch, through: :sale
    scope :no_transactions, -> { where non_transac: false }

    def average_per
        #get count average
        average = (sale.net_total_sales / count.to_d).round(2)
        label = non_transac ? " #{self.statistic.name} PTA" : " #{self.statistic.name} PPA"

        #get sales per date
        this_month = branch.sales.where(sale_date: sale.sale_date.all_month)        
        this_year = branch.sales.where(sale_date: sale.sale_date.beginning_of_year..sale.sale_date)
        
        #get total net sales
        month_sales = this_month.map(&:net_total_sales).sum
        year_sales = this_year.map(&:net_total_sales).sum

        #get total counts
        month_count = this_month.present? ? this_month.map {|s| s.sales_stats.where(statistic_id: self.statistic_id).map(&:count).sum }.sum : 0.0
        year_count = this_year.present? ? this_year.map {|s| s.sales_stats.where(statistic_id: self.statistic_id).map(&:count).sum }.sum : 0.0        
        
        monthly_ave = month_sales == 0 || month_count == 0 ? 0.0 : (month_sales / month_count.to_d).round(2)
        yearly_ave = year_sales == 0 || year_count == 0 ? 0.0 : (year_sales / year_count.to_d).round(2)

        return { label: label, average: average, month_count: month_count, year_count: year_count, monthly_ave: monthly_ave, yearly_ave: yearly_ave  }
    end
end