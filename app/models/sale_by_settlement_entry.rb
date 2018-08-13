class SaleBySettlementEntry < ActiveRecord::Base
  belongs_to :settlement
  belongs_to :sale
  has_one :branch, through: :sale  

  def get_sales_per
    this_month = branch.sales.where(sale_date: sale.sale_date.all_month)
    this_year = branch.sales.where(sale_date: sale.sale_date.beginning_of_year..sale.sale_date)
    month_total = this_month.present? ? this_month.map {|s| s.sale_by_settlement_entries.where(settlement_id: self.settlement_id).map(&:amount).sum }.sum : 0.0
    year_total = this_year.present? ? this_year.map {|s| s.sale_by_settlement_entries.where(settlement_id: self.settlement_id).map(&:amount).sum }.sum : 0.0
    month_daily_average = month_total == 0 ? 0 : (month_total / this_month.size).to_d.round(2)
    year_daily_average = year_total == 0 ? 0 : (year_total / this_year.size).to_d.round(2)
    return { month: month_total, year: year_total, monthly_daily_ave: month_daily_average, year_daily_average: year_daily_average }
  end
end
