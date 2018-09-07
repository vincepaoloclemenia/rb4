class Brand < ActiveRecord::Base
  extend FriendlyId
  Currencies = [["Philippine Peso (₱)", "php"], ["United States Dollar ($)", "usd"], ["Hongkong Dollar (HK$)", "hkd"]]
  friendly_id :name, use: :slugged
  belongs_to :client
  has_many :branches, dependent: :destroy
  has_many :client_user_accesses, dependent: :destroy										# => for rescue purposes, associated roles and branches
  has_many :roles, through: :client_user_accesses		# => for rescue purposes, associated roles and branches
  has_many :categories, dependent: :destroy
  has_many :subcategories, -> { where.not(parent_id: nil) }, class_name: 'Category', dependent: :destroy
  has_many :shifts, dependent: :destroy
  has_many :sales, through: :branches
  has_many :employees, through: :branches, dependent: :destroy
  has_many :units, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :inventories, through: :branches, dependent: :restrict_with_error
  has_many :conversions, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :purchase_items, through: :purchases
  has_many :suppliers, dependent: :destroy
  has_many :sale_reports, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :purchase_orders, dependent: :destroy
  has_many :purchase_order_items, through: :purchase_orders
  has_many :order_lists, through: :branches, dependent: :destroy
  has_one :brand_setting, dependent: :destroy
  has_many :inventory_items, through: :inventories
  has_many :subscribed_branches, -> { includes(:branch_subscription).where.not( branch_subscriptions: { branch_id: nil }).where( branch_subscriptions: { active: true }) }, dependent: :destroy, class_name: "Branch"
  has_many :unsubscribed_branches, -> { includes(:branch_subscription).where( branch_subscriptions: { branch_id: nil }) }, dependent: :destroy, class_name: "Branch"
  has_many :cancelled_branches, -> { includes(:branch_subscription).where( branch_subscriptions: { active: false }) }, dependent: :destroy, class_name: "Branch"  
  has_many :employee_types, dependent: :destroy
  has_many :employee_benefits, dependent: :destroy
  has_many :holidays, dependent: :destroy
  has_many :timesheet_fields, dependent: :destroy
  has_many :tax_types, dependent: :destroy
  has_many :sale_by_category_entries, through: :sales
  has_many :sale_by_settlement_entries, through: :sales
  has_many :sales_non_misces, through: :sales
  has_many :sales_stats, through: :sales

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "35x35>" }, :default_url => "/img/brand2.png"
  validates_attachment :avatar, 
                       :content_type => { :content_type => /^image\/(png|gif|jpeg|jpg)/, message: "must be in the format png|gif|jpg" },
                       :size => { :in => 0..1000.kilobytes, message: "must be less than 1MB" }

	validates :name,
						presence: true,
						length: {
							maximum: 50
						},
            uniqueness: { scope: :client_id, message: "already exist", case_sensitive: false }

  accepts_nested_attributes_for :branches, reject_if: :all_blank, allow_destroy: true

  after_create :brand_setting_setup

  # Selections
  def brand_setting_setup
    create_brand_setting
  end

  def admins
    self.client.users.includes(:role).where( roles: { role_level: 'brand' } )
  end


  # Sales
  def get_sales_average
    total_days = created_at.to_date == Date.today ? 1 : ( Date.today - created_at.to_date ).to_i
    average_sales = if sales.present?       
      sales.where(sale_date: created_at..Date.today).pluck(:net_total_sales).sum / total_days
    else
      0
    end
    return average_sales
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
    last_week = sales.where(sale_date: Date.today.last_week.beginning_of_week..(Date.today - 7))
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


  # Restriction
  def restrict_branch_admins?
    if brand_setting.present? && brand_setting.send_pos?
      setting = brand_setting.purchase_order_schedule[Date.today.wday]
      complete_range = (eval(setting["allowed"]) && setting["from"].present? && setting["to"].present? && ( setting["from"].to_time > Time.now || Time.now > setting["to"].to_time ))
      from_range_only = (eval(setting["allowed"]) && setting["from"].blank? && setting["to"].present? && Time.now > setting["to"].to_time)
      to_range_only = (eval(setting["allowed"]) && setting["from"].present? && setting["to"].blank? && setting["from"].to_time > Time.now )
      return !eval(setting["allowed"]) || complete_range || from_range_only || to_range_only
    else
      false
    end
  end

  def allow_submission?
    !restrict_branch_admins?
  end

  def allowed_admin?(action, id)
    brand_setting.purchase_order_privilege[action].include?(id)
  end

  def admin_has_privilege?(action, user_id)
    brand_setting.purchase_order_privilege[action].include? user_id
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


  # PurchaseItems
  def get_total_per_month(item_id, date)
    pis = purchase_items.includes(:purchase).where(purchases: { purchase_date: date.beginning_of_month..date }, item_id: item_id )
    total_cost = pis.sum(:purchase_item_amount)
    average_cost = total_cost == 0 ? 0.0 : (total_cost / pis.size).round(2)
    return { total: total_cost, average: average_cost }
  end

  def get_total_per_year(item_id, date)
    pis = purchase_items.includes(:purchase).where(purchases: { purchase_date: date.beginning_of_year..date }, item_id: item_id )
    total_cost = pis.sum(:purchase_item_amount)
    average_cost = total_cost == 0 ? 0.0 : (total_cost / pis.size).round(2)
    return { total: total_cost, average: average_cost }
  end

end
