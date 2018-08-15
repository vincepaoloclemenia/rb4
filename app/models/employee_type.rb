class EmployeeType < ActiveRecord::Base
	has_many :employees
  #belongs_to :dividend, class_name: 'Category', foreign_key: :dividend_id
  
  validates :name, presence: true, uniqueness: true

	#class methods
  def self.labor_hours_by_sale_category(date,branches,current_brand)
    @employee_types = EmployeeType.includes([employees:[labor_hours:[:labor_hours_entries]]])
    @date = date
    
    if Date.strptime(@date, '%m/%d/%Y') > Date.strptime(@date, '%m/%d/%Y').beginning_of_month
      @date = Date.strptime(@date, '%m/%d/%Y').beginning_of_month
    else
      @date = Date.strptime(@date, '%m/%d/%Y') - 1.month
    end   

    @branches = branches
    man_hours ||= []

    @employee_types.each do |employee_type|
      @total_hours = 0
      @emp_ids = employee_type.employees.where(employee_type_id: employee_type.id, branch_id: @branches).map{ |e| e.id}
      @labor_ids = LaborHour.where(employee_id: @emp_ids).map{ |l| l.id}
      @lh_entries = LaborHoursEntry.where(labor_hour_id: @labor_ids, working_date: [(@date.beginning_of_month.beginning_of_day + 8.hours)..(@date.end_of_month.end_of_day + 8.hours)])

      @total_hours += @lh_entries.sum(:regular)
      @total_hours += @lh_entries.sum(:overtime)
      @total_hours += @lh_entries.sum(:legal_holiday)
      @total_hours += @lh_entries.sum(:special_holiday)
      man_hours << {name: employee_type.name, hours: @total_hours.to_f, dividend_id: employee_type.dividend_id}
    end
    get_sales(man_hours,@branches,@date,current_brand)
  end
  
  def self.get_sales(man_hours,branches,date,current_brand)
    labor_hours ||= []
    @sales = Sale.where(sale_date: [(date.beginning_of_month)..(date.end_of_month)], branch_id: branches)
    # @ids = @sales.map {|s| s.id}
    @ids = @sales.pluck(:id)
    man_hours.each do |mh|
      labor_hours << {name: mh[:name], hours: mh[:hours], dividend_id: mh[:dividend_id]}
    end
    get_entries(labor_hours,current_brand,@ids)
  end 

  def self.get_entries(labor_hours,current_brand,sale_ids)
    final_hours = []
    @spmh = 0
    @amount = 0
    @sale_by_categories = []
    labor_hours.each do |lh|
      if lh[:dividend_id] == 0
        @current_brand_categories_ids = Category.find(:all, :conditions => { :track_as_sales => true} ).map {|c| c.id}
        @sale_by_categories = SaleByCategoryEntry.where(sale_id: sale_ids, category_id: @current_brand_categories_ids)
        @amount = @sale_by_categories.map(&:amount).reject{|a| a.nil?}.inject(:+)
      else
        @sale_by_categories = SaleByCategoryEntry.where(sale_id: lh[:sale_ids], category_id: lh[:dividend_id])
        @amount = @sale_by_categories.map(&:amount).reject{|a| a.nil?}.inject(:+)
      end
      @spmh = @amount.to_f / lh[:hours].to_f if @amount.to_f > 0 && lh[:hours].to_f > 0
      final_hours << {name: lh[:name], hours: lh[:hours] , dividend_id: lh[:dividend_id], spmh: @spmh.to_f, amount: @amount}
      @spmh = 0
      @amount = 0
    end
    final_hours
  end  

end

