class Branch < ActiveRecord::Base
  belongs_to :brand
  belongs_to :subscription
  has_many :sales
  has_many :employees
  has_many :inventories, dependent: :restrict_with_error
  has_many :purchases
  has_many :branch_subscriptions
  has_many :subscriptions, through: :branch_subscriptions

  # scope :all_unsubscribed, -> { joins(:subscriptions).where.not('subscriptions.status = ?', "Active") }
  # scope :all_subscribed, -> { joins(:subscriptions).where.not('subscriptions.plan_id = ?', 1).where('subscriptions.status = ? OR subscriptions.status = ?', "Active", "Processing") }
  
  validates :name,
						presence: true,
						length: {
							maximum: 50
						},
            uniqueness: { scope: :brand_id, message: "already exist", case_sensitive: false }

  after_create :set_default_color

  def self.all_unsubscribed
    # select { |b| b.subscription.nil? || b.subscription.plan_id.eql?(1) }
    select { |b| b.subscription.nil? || b.free_trial? }
    # joins(:subscriptions).where.not("subscriptions.status = ?", "Active")
  end

  def self.all_unsubscribed_name_id
    self.all_unsubscribed.collect { |b| [b.name, b.id] }
  end

  def self.all_subscribed
    select { |b| b.subscribed? || b.free_trial? }
  end
  
  def self.all_subscribed_name_id
    self.all_subscribed.collect { |b| [b.name, b.id] }
  end

  def free_trial
    self.subscriptions.find_by_plan_id(1)
  end

  def free_trial?
    free_trial.present?
  end

  def subscription
    self.subscriptions.where.not(plan_id: 1).find_by_status(["Active","Processing"])
  end

  def subscribed?
    free_trial.present? || subscription.present?
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
      num_of_days = (@sales.last.sale_date - @sales.first.sale_date).to_i      
      sales.all.where(sale_date: @sales.first.sale_date..@sales.last.sale_date).pluck(:net_total_sales).sum / num_of_days
    else
      return "Incomplete Sales Information"
    end
  end

  def average_sales(date_from, date_to)
    unless valid_branch?
      num_of_days = (date_to - date_from).to_i
      sales.where(sale_date: date_from..date_to).pluck(:net_total_sales).sum / num_of_days
    else
      return "Unable to calculate"
    end
	end

  def valid_branch?
    sales.invalid_sales?
  end

end
