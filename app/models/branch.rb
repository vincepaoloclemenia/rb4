class Branch < ActiveRecord::Base
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

  # scope :all_unsubscribed, -> { joins(:subscriptions).where.not('subscriptions.status = ?', "Active") }
  # scope :all_subscribed, -> { joins(:subscriptions).where.not('subscriptions.plan_id = ?', 1).where('subscriptions.status = ? OR subscriptions.status = ?', "Active", "Processing") }
  
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { scope: :brand_id, message: "already exist", case_sensitive: false }
  validates :aka, presence: true, uniqueness: { scope: :brand_id, message: "already exist", case_sensitive: false }, if: :wizard_done?
  validates :company_registered_name, presence: true
  validates :tin_number, presence: true, uniqueness: true, if: :wizard_done?
  validate :validate_alias, on: [:create, :update], if: :wizard_done?
  after_create :set_default_color

  def free_trial?
    brand.client.on_free_trial?
  end

  def subscribed?
    branch_subscription.present?
  end

  def validate_alias
    if !( /\s/ =~ aka ).nil?
      errors.add('Alias', 'should not have spaces')
    end
  end

  def set_default_color
    #for nil branch color
    if self.color.nil?
      color_set = ["#60355B","#E26A6A","#FF4500","#DC143C","#FF8C00","#C71585","#1E81B4","#00A087","#DD525B",
                  "#8CAF41","#8F7260","#4F669D","#646464","#AAA786","#6F9684","#98ACD1"]
      self.update color: color_set.sample
    end
  end

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

  def valid_branch?
    sales.invalid_sales?
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

  def last_week_sales
    last_week_sales_average = if sales.any? && !nil? 
      sales.where(sale_date: (Date.today - 7)..Date.today).pluck(:net_total_sales).sum / 7
    else
      0
    end
    return last_week_sales_average
  end

  def customer_count_average
    total_days = created_at.to_date == Date.today ? 1 : ( Date.today - created_at.to_date ).to_i
    count_average = if sales.any? && !nil?       
      sales.where(sale_date: created_at..Date.today).pluck(:customer_count).sum / total_days
    else
      0
    end
    return count_average
  end

  def last_week_customer_count
    last_week_count_average = if sales.any? && !nil? 
      sales.where(sale_date: (Date.today - 7)..Date.today).pluck(:customer_count).sum / 7
    else
      0
    end
    return last_week_count_average
  end

  def average_revenues(range)
    case range
      when "daily"
        @total_days = created_at.to_date == Date.today ? 1 : ( Date.today - created_at.to_date ).to_i
        @all_sales = sales.any? ? sales.where(sale_date: created_at..Date.today).pluck(:net_total_sales).sum : 0
        @sales_vat = sales.any? ? sales.where(sale_date: created_at..Date.today).pluck(:vat).sum : 0
        @service_charge = sales.any? ? sales.where(sale_date: created_at..Date.today).pluck(:service_charge).sum : 0
      when "last_week"
        @total_days = 7
        @all_sales = sales.any? ? sales.where(sale_date: (Date.today - 7)..Date.today).pluck(:net_total_sales).sum : 0
        @sales_vat = sales.any? ? sales.where(sale_date: (Date.today - 7)..Date.today).pluck(:vat).sum : 0
        @service_charge = sales.any? ? sales.where(sale_date: (Date.today - 7)..Date.today).pluck(:service_charge).sum : 0
    end
    
    average_revenues = if sales.any? && !nil?
      ( @all_sales + @sales_vat + @service_charge ) / @total_days
    else
      0
    end

    return average_revenues
  end

  def filter_sales_purchase_items
    records = []
    records << purchase_items.all.to_a
    records << sales.all.to_a
    records
  end

  def sent_approved_purchased_orders
    purchase_orders.where(status: "Approved", sent: true, saved_as_purchase: false)
  end

  protected

    def wizard_done?
      self.brand.client.users.includes(:role).where( roles: { role_level: [nil, "client"] } ).first.flag >= 6
    end

end
