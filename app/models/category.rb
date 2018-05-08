class Category < ActiveRecord::Base
  belongs_to :brand
  belongs_to :parent, class_name: "Category"
  has_many :subcategories, class_name: "Category", foreign_key: :parent_id, dependent: :destroy
  has_many :items

  validates :brand_id, :name, presence: true
  validates :name,           length: { maximum: 50 }, :uniqueness => {scope: :brand_id}
  validates :description,    length: { maximum: 250 }

  scope :main, -> { where(parent_id: nil) }
  scope :saleable, -> { where(is_active: true, track_as_sales: true) }


  def is_subcategory?
    parent_id.present?
  end

  def total_revenue_month_to_date(branch_id, date)
    date = Date.strptime(date, "%m/%d/%Y") rescue Date.today
    start_date, end_date = date.beginning_of_month, date

    sales_id = Sale.where(branch_id: branch_id, sale_date: start_date..end_date).pluck(:id)
    SaleByCategoryEntry.where(sale_id: sales_id, category_id: id).sum(:amount)
  end

  def total_cost_of_sales_month_to_date(branch_id, date)
    date = Date.strptime(date, "%m/%d/%Y") rescue Date.today
    start_date, end_date = date.beginning_of_month, date

    purchases = Purchase.where(branch_id: branch_id, purchase_date: start_date..end_date)
    purchase_ids = purchases.pluck(:id)
    purchase_items = PurchaseItem.where(purchase_id: purchase_ids).includes(item: :category)

    compute_category_purchase_items(purchase_items)
  end

  def compute_category_purchase_items(purchase_items)
    grand_total = 0
    purchase_items.each do |pi|
      cat_id = pi.item.category_id
      parent_id = pi.item.category.parent_id
      if cat_id == id || parent_id == id
        total = pi.quantity * pi.purchase_item_amount
        total = total * 0.89 if pi.vat_type == 'VAT-Inclusive'
        grand_total =+ total
      end
    end
    grand_total
  end

  def cat_amount_total(branch_id, category_id, date_entry)
    total = 0
    date = Date.strptime(date_entry, "%m/%d/%Y") rescue Date.today
    start_date, end_date = date.beginning_of_month, date

    purchases = Purchase.where(branch_id: branch_id, purchase_date: start_date..end_date)
    purchase_ids = purchases.pluck(:id)
    purchase_items = PurchaseItem.where(purchase_id: purchase_ids).includes(item: :category)
    purchase_items.each do |purchase_item|
      cat_id = purchase_item.item.category_id
      if category_id == cat_id
        total += purchase_item.purchase_item_amount
      end
    end
    total
  end
end
