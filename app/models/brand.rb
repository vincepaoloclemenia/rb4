class Brand < ActiveRecord::Base
  belongs_to :client
  has_many :branches
  has_many :client_user_accesses										# => for rescue purposes, associated roles and branches
  has_many :roles, through: :client_user_accesses		# => for rescue purposes, associated roles and branches
  has_many :categories
  has_many :shifts
  has_many :sales, through: :branches
  has_many :employees
  has_many :units
  has_many :items
  has_many :inventories, through: :branches, dependent: :restrict_with_error
  has_many :conversions
  has_many :purchases
  has_many :purchase_items, through: :purchases
  has_many :suppliers
  has_many :sale_reports

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

  def get_sales_average
    total_days = created_at.to_date == Date.today ? 1 : ( Date.today - created_at.to_date ).to_i
    average_sales = if sales.any? && !nil?       
      sales.where(sale_date: created_at..Date.today).pluck(:net_total_sales).sum / total_days
    else
      0
    end
    return average_sales
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

end
