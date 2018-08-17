class Brand < ActiveRecord::Base
  extend FriendlyId
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
  has_many :subscribed_branches, -> { includes(:branch_subscription).where.not( branch_subscriptions: { branch_id: nil }) }, dependent: :destroy, class_name: "Branch"
  has_many :unsubscribed_branches, -> { includes(:branch_subscription).where( branch_subscriptions: { branch_id: nil }) }, dependent: :destroy, class_name: "Branch"
  has_many :employee_types, dependent: :destroy
  has_many :employee_benefits, dependent: :destroy
  has_many :holidays, dependent: :destroy
  has_many :timesheet_fields, dependent: :destroy

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

  def brand_setting_setup
    create_brand_setting
  end

  def get_sales_average
    total_days = created_at.to_date == Date.today ? 1 : ( Date.today - created_at.to_date ).to_i
    average_sales = if sales.any? && !nil?       
      sales.where(sale_date: created_at..Date.today).pluck(:net_total_sales).sum / total_days
    else
      0
    end
    return average_sales
  end

  def allowed_admin?(action, id)
    brand_setting.purchase_order_privilege[action].include?(id)
  end

  def last_week_sales
    last_week_sales_average = if sales.any? && !nil? 
      sales.where(sale_date: (Date.today - 7)..Date.today).pluck(:net_total_sales).sum / 7
    else
      0
    end
    return last_week_sales_average
  end

  #def branches
   # if client.on_free_trial?
		#	branches
		#else
		#	branches.includes(:branch_subscription).where.not( branch_subscriptions: { branch_id: nil })
		#end
  #end

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

  def admins
    self.client.users.includes(:role).where( roles: { role_level: 'brand' } )
  end

  def admin_has_privilege?(action, user_id)
    brand_setting.purchase_order_privilege[action].include? user_id
  end

end
