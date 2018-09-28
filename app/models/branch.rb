class Branch < ActiveRecord::Base
  #Associations
  belongs_to :brand
  has_one :client, through: :brand
  belongs_to :subscription
  has_many :sales
  has_many :employees
  has_many :inventories, dependent: :restrict_with_error
  has_many :inventory_items, through: :inventories
  has_many :purchases
  has_many :purchase_items, through: :purchases
  has_one :branch_subscription
  has_one :subscription, through: :branch_subscription
  has_many :purchase_orders, dependent: :destroy
  has_many :order_lists, dependent: :destroy
  has_one :branch_purchase_order_setup
  has_many :sale_by_category_entries, through: :sales
  has_many :sale_by_settlement_entries, through: :sales
  has_many :sales_stats, through: :sales
  has_many :sales_non_misces, through: :sales
  has_many :employee_types
  has_many :timesheets, through: :employees
  has_one :branch_tax, dependent: :destroy
  has_one :tax_type, through: :branch_tax
  has_many :sale_by_category_entries, through: :sales
  has_many :sale_by_settlement_entries, through: :sales

  #Nested Models
  accepts_nested_attributes_for :employees, :allow_destroy => :true  
  accepts_nested_attributes_for :branch_tax
  
  # Entry Validations
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { scope: :brand_id, message: "already exist", case_sensitive: false }
  validates :aka, presence: true, uniqueness: { scope: :brand_id, message: "already exist", case_sensitive: false }, if: :wizard_done?
  validates :company_registered_name, presence: true
  validates :tin_number, presence: true, uniqueness: true, if: :wizard_done?
  validate :validate_alias, on: [:create, :update], if: :wizard_done?
  after_create :set_default_color

  # Object Validation
  def valid_branch?
    sales.invalid_sales?
  end

  def free_trial?
    brand.client.on_free_trial?
  end

  def subscribed?
    if branch_subscription.present?
      branch_subscription.subs_end >= Date.today && branch_subscription.active == true
    else
      false
    end
  end

  def validate_alias
    if !( /\s/ =~ aka ).nil?
      errors.add('Alias', 'should not have spaces')
    end
  end

  
  # Tax stuff
  def percentage_tax
    tax = tax_type.present? ? tax_type.percentage : 12.0
    return { inc: (1 + (tax / 100)).to_d, dec: (tax / 100).to_d }
  end


  # Branch Setting
  def set_default_color
    #for nil branch color
    if self.color.nil?
      color_set = ["#60355B","#E26A6A","#FF4500","#DC143C","#FF8C00","#C71585","#1E81B4","#00A087","#DD525B",
                  "#8CAF41","#8F7260","#4F669D","#646464","#AAA786","#6F9684","#98ACD1"]
      self.update color: color_set.sample
    end
  end


  # Sales
  def daily_average_sales
    unless valid_branch?
      @sales = sales.all.order(sale_date: :asc)
      num_of_days = (Date.today - created_at.to_date).to_i      
      sales.all.where(sale_date: created_at.to_date..Date.today).pluck(:net_total_sales).sum / num_of_days
    else
      return "Incomplete Sales Information"
    end
  end

  def average_sales(date_from, date_to)
    unless valid_branch?
      num_of_days = sales.where(sale_date: date_from..date_to).exists? ? (date_to - date_from).to_i : 1
      sales.where(sale_date: date_from..date_to).pluck(:net_total_sales).sum / num_of_days
    else      
      return"Unable to calculate"
    end
  end
  
  def total_average_sales
    if valid_branch?
      return 0
    else
      total_days = created_at.to_date == Date.today ? 1 : ( Date.today - created_at.to_date ).to_i
      average_sales = sales.where(sale_date: created_at..Date.today).pluck(:net_total_sales).sum / total_days
      
      return average_sales
    end
  end

  def this_week_sales
    this_week = sales.where(sale_date: Date.today.beginning_of_week..Date.today)
    total = this_week.present? ? this_week.map(&:net_total_sales).sum : 0.0
    this_week_sales_average = total != 0 ? total / this_week.size : 0.0
    
    return { total: total, average: this_week_sales_average }
  end

  def this_month_sales
    this_month = sales.where(sale_date: Date.today.beginning_of_month..Date.today)
    total = this_month.present? ? this_month.map(&:net_total_sales).sum : 0.0
    average = total != 0 ? total / this_month.size : 0.0
    return { total: total, average: average }
  end

  def this_year_sales
    this_year = sales.where(sale_date: Date.today.beginning_of_year..Date.today)
    total = this_year.present? ? this_year.pluck(:net_total_sales).sum : 0.0
    average = total != 0 ? total / this_year.size : 0.0
    return { total: total, average: average }
  end

  def last_week_sales
    last_week = sales.where(sale_date: Date.today.last_week.beginning_of_week..(Date.today - 7) )
    total = last_week.present? ? last_week.map(&:net_total_sales).sum : 0.0
    average = total != 0 ? total / last_week.size : 0.0
    return { total: total, average: average }
  end

  def last_month_sales
    last_month = sales.where(sale_date: Date.today.last_month.beginning_of_month..Date.today.last_month)
    total = last_month.present? ? last_month.map(&:net_total_sales).sum : 0.0
    average = total != 0 ? total / last_month.size : 0.0
    return { total: total, average: average }
  end

  def last_year_sales
    last_year = sales.where(sale_date: Date.today.last_year.beginning_of_year..Date.today.last_year)
    total = last_year.present? ? last_year.map(&:net_total_sales).sum : 0.0
    average = total != 0 ? total / last_year.size : 0.0
    return { total: total, average: average }
  end

  
  # SalesByCategoryEntries
  def get_mtd_sales_per_cat(category_id, date)
    sales_per_cat = sale_by_category_entries.includes(:sale).where( category_id: category_id, sales: { sale_date: date.beginning_of_month..date } )
    total = sales_per_cat.sum(:amount)
    ave = sales_per_cat.present? ? (total / sales_per_cat.size).round(2) : 0.0
    return { total: total, ave: ave }
  end

  def get_ytd_sales_per_cat(category_id, date)
    sales_per_cat = sale_by_category_entries.includes(:sale).where( category_id: category_id, sales: { sale_date: date.beginning_of_year..date } )
    total = sales_per_cat.sum(:amount)
    ave = sales_per_cat.present? ? (total / sales_per_cat.size).round(2) : 0.0
    return { total: total, ave: ave }
  end

  def get_total_mtd_sales_all_cat(date)
    all_sales_by_cat = sale_by_category_entries.includes(:sale).where( sales: { sale_date: date.beginning_of_month..date } )
    total = all_sales_by_cat.sum(:amount)    
    ave = all_sales_by_cat.present? ? ( total / all_sales_by_cat.pluck(:sale_id).uniq.size ).round(2) : 0.0
    return { total: total, ave: ave}
  end

  def get_total_ytd_sales_all_cat(date)
    all_sales_by_cat = sale_by_category_entries.includes(:sale).where( sales: { sale_date: date.beginning_of_year..date } )
    total = all_sales_by_cat.sum(:amount)    
    ave = all_sales_by_cat.present? ? ( total / all_sales_by_cat.pluck(:sale_id).uniq.size ).round(2) : 0.0
    return { total: total, ave: ave}
  end


  # SaleBySettlementEntry
  def get_mtd_settlements(setllement_id, date)
    sale_by_settlement_entries.includes(:sale).where( settlement_id: setllement_id, sales: { sale_date: date.beginning_of_month..date } ).sum(:amount)
  end

  def get_ytd_settlements(setllement_id, date)
    sale_by_settlement_entries.includes(:sale).where( settlement_id: setllement_id, sales: { sale_date: date.beginning_of_year..date } ).sum(:amount)
  end


  # SalesStats
  def get_mtd_sales_stats(statistic_id, date)
    sales_stats.includes(:sale).where(statistic_id: statistic_id, sales: { sale_date: date.beginning_of_month..date} ).sum(:count)
  end

  def get_ytd_sales_stats(statistic_id, date)
    sales_stats.includes(:sale).where(statistic_id: statistic_id, sales: { sale_date: date.beginning_of_year..date} ).sum(:count)
  end

  def get_settlement_stat_ave(mtd, ytd, settlement_id, date)
    mtd_stat = get_mtd_settlements(settlement_id, date)
    ytd_stat = get_ytd_settlements(settlement_id, date)
    mtd_ave = mtd_stat == 0 || mtd == 0 ? 0.0 : (mtd / mtd_stat).round(2)
    ytd_ave = ytd_stat == 0 || ytd == 0 ? 0.0 : (ytd / ytd_stat).round(2)
    return { mtd_ave: mtd_ave, ytd_ave: ytd_ave }
  end


  # Sales Non Misces
  def get_mtd_non_misces(non_misce_id, date)
    sales_non_misces.includes(:sale).where( non_misce_id: non_misce_id, sales: { sale_date: date.beginning_of_month..date } ).sum(:count)
  end

  def get_ytd_non_misces(non_misce_id, date)
    sales_non_misces.includes(:sale).where( non_misce_id: non_misce_id, sales: { sale_date: date.beginning_of_year..date } ).sum(:count)
  end

  def get_total_of_year_inc(date)
    sales_non_misces.inc.includes(:sale).where( sales: { sale_date: date.beginning_of_year..date } ).sum(:count)    
  end

  def get_total_of_month_inc(date)
    sales_non_misces.inc.includes(:sale).where( sales: { sale_date: date.beginning_of_month..date } ).sum(:count)    
  end

  # Revenues
  def this_week_revenues
    this_week = sale_by_category_entries.includes(:sale).where(sales: { sale_date: Date.today.beginning_of_week..Date.today } ) 
    total = this_week.present? ? this_week.pluck(:amount).sum : 0.0
    average = total != 0 ? total / this_week.map(&:sale_id).uniq.size : 0.0
    return { total: total, average: average }
  end

  def this_month_revenues
    this_month = sale_by_category_entries.includes(:sale).where(sales: { sale_date: Date.today.beginning_of_month..Date.today } ) 
    total = this_month.present? ? this_month.pluck(:amount).sum : 0.0
    average = total != 0 ? total / this_month.map(&:sale_id).uniq.size : 0.0
    return { total: total, average: average }
  end

  def this_year_revenues
    this_year = sale_by_category_entries.includes(:sale).where(sales: { sale_date: Date.today.beginning_of_year..Date.today } ) 
    total = this_year.present? ? this_year.pluck(:amount).sum : 0.0
    average = total != 0 ? total / this_year.map(&:sale_id).uniq.size : 0.0
    return { total: total, average: average }
  end

  def last_week_revenues
    reveneues = sale_by_category_entries.includes(:sale).where(sales: { sale_date: Date.today.last_week.beginning_of_week..(Date.today - 7) } )
    total = reveneues.present? ? reveneus.pluck(:amount).sum : 0.0
    average = total != 0 ? total / reveneues.map(&:sale_id).uniq.size : 0.0
    return { total: total, average: average }
  end

  def last_month_revenues
    reveneues = sale_by_category_entries.includes(:sale).where(sales: { sale_date: Date.today.last_month.beginning_of_month..Date.today.last_month } )
    total = reveneues.present? ? reveneus.pluck(:amount).sum : 0.0
    average = total != 0 ? total / reveneues.map(&:sale_id).uniq.size : 0.0
    return { total: total, average: average }
  end

  def last_year_revenues
    reveneues = sale_by_category_entries.includes(:sale).where(sales: { sale_date: Date.today.last_year.beginning_of_year..Date.today.last_year } )
    total = reveneues.present? ? reveneus.pluck(:amount).sum : 0.0
    average = total != 0 ? total / reveneues.map(&:sale_id).uniq.size : 0.0
    return { total: total, average: average }
  end

  
  # Selections
  def filter_sales_purchase_items
    records = []
    records << purchase_items.all.to_a
    records << sales.all.to_a
    records
  end

  def sent_approved_purchased_orders
    purchase_orders.where(status: "Approved", sent: true, saved_as_purchase: false)
  end


  # PurchaseItems
  def get_total_per_month(item_id, date)
    pis = purchase_items.includes(:purchase).where(item_id: item_id, purchases: { purchase_date: date.all_month } )
    total_cost = pis.sum(:purchase_item_amount)
    average_cost = total_cost == 0 ? 0.0 : (total_cost / pis.size).round(2)
    return { total: total_cost, average: average_cost }
  end

  def get_total_per_year(item_id, date)
    pis = purchase_items.includes(:purchase).where(item_id: item_id, purchases: { purchase_date: date.all_year } )
    total_cost = pis.sum(:purchase_item_amount)
    average_cost = total_cost == 0 ? 0.0 : (total_cost / pis.size).round(2)
    return { total: total_cost, average: average_cost }
  end

  def self.subscribers
    all.reject { |br| !br.subscribed? }
  end

  protected

    def wizard_done?
      self.brand.client.users.includes(:role).where( roles: { role_level: [nil, "client"] } ).first.flag >= 6
    end

end
