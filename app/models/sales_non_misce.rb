class SalesNonMisce < ActiveRecord::Base
    belongs_to :sale
    has_one :branch, through: :sale
    belongs_to :non_misce
    #validates :count, presence: true
    scope :inc, -> { where percentage_scope: true }
    #scope :exc, -> { where.not percentage_scope: true }

    def self.exc 
        where.not( percentage_scope: true ).reject { |nm| nm.non_misce.is_sub_non_misce? }
    end

    def self.sub_exc
        where.not( percentage_scope: true ).reject { |nm| !nm.non_misce.is_sub_non_misce? }
    end
    
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


    # Class Methods
    def self.this_year_count
        records = inc.all.includes(:sale).where( sales: { sale_date: Date.today.beginning_of_year..Date.today} )
        total = records.sum(:count)
        average = total == 0 ? 0.0 : (total / records.map(&:sale_id).uniq.size).round(2)
        return { total: total, average: average }
    end

    def self.this_month_count
        records = inc.all.includes(:sale).where( sales: { sale_date: Date.today.beginning_of_month..Date.today} )
        total = records.sum(:count)
        average = total == 0 ? 0.0 : (total / records.map(&:sale_id).uniq.size).round(2)
        return { total: total, average: average }
    end

    def self.this_week_count
        records = inc.all.includes(:sale).where( sales: { sale_date: Date.today.beginning_of_week..Date.today} )
        total = records.sum(:count)
        average = total == 0 ? 0.0 : (total / records.map(&:sale_id).uniq.size).round(2)
        return { total: total, average: average }
    end

    def self.highest_count
        inc.includes(:sale).where( sales: { sale_date: Date.today.beginning_of_year..Date.today} ).group_by { |x| x.sale_id }.values.map { |s| s.map(&:count).sum }.max
    end

    def self.lowest_count
        inc.includes(:sale).where( sales: { sale_date: Date.today.beginning_of_year..Date.today} ).group_by { |x| x.sale_id }.values.map { |s| s.map(&:count).sum }.min
    end

end