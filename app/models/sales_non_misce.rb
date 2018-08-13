class SalesNonMisce < ActiveRecord::Base
    belongs_to :sale
    has_one :branch, through: :sale
    belongs_to :non_misce
    #validates :count, presence: true
    scope :inc, -> { where percentage_scope: true }
    scope :exc, -> { where.not percentage_scope: true }

    def get_misces_per_inc
        this_month = branch.sales.where( sale_date: sale.sale_date.all_month)
        this_year = branch.sales.where( sale_date: sale.sale_date.beginning_of_year..sale.sale_date)

        month_count = this_month.map{ |s| s.sales_non_misces.where(non_misce_id: self.non_misce_id).map(&:count).sum }.sum
        year_count = this_year.map{ |s| s.sales_non_misces.where(non_misce_id: self.non_misce_id).map(&:count).sum }.sum

        return { month_count: month_count, year_count: year_count }
    end
    
    def get_misces_per_exc
        this_month = branch.sales.where( sale_date: sale.sale_date.all_month)
        this_year = branch.sales.where( sale_date: sale.sale_date.beginning_of_year..sale.sale_date)

        month_count = this_month.map{ |s| s.sales_non_misces.where(non_misce_id: self.non_misce_id).map(&:count).sum }.sum
        year_count = this_year.map{ |s| s.sales_non_misces.where(non_misce_id: self.non_misce_id).map(&:count).sum }.sum

        return { month_count: month_count, year_count: year_count }
    end

end