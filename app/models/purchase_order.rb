class PurchaseOrder < ActiveRecord::Base
  include PgSearch
  belongs_to :user
	belongs_to :client
  belongs_to :brand
  belongs_to :branch
  belongs_to :supplier
  has_many :purchase_order_items, dependent: :destroy
  has_many :items, through: :purchase_order_items, dependent: :destroy

  default_scope -> { order(created_at: :desc) }
  scope :approved_pos, ->  { where status: 'Approved' }
  scope :new_pos, -> { includes(:purchase_order_items).where( status: 'Pending' ).where.not( purchase_order_items: { purchase_order_id: nil } ) }
  scope :on_hold_pos, -> { where status: 'On Hold' }
  scope :rejected_pos, -> { where status: 'Rejected' }
  scope :sent_purchase_orders, -> { where sent: true, status: 'Approved' }
  scope :unsent_pos, -> { where(sent: false, status: ["Approved", "Pending"]) }

  accepts_nested_attributes_for :purchase_order_items,  :reject_if => :all_blank, :allow_destroy => :true
  
  validates :delivery_date, :delivery_time, presence: true, if: :approved?

  pg_search_scope :search_po_number, against: [ :po_number ], using: { tsearch: { prefix: true, any_word: true } }
  pg_search_scope :search_status, against: [ :status ]  
  pg_search_scope :search_branches, associated_against: { branch: [:id] }, using: { tsearch: { any_word: true } }
  pg_search_scope :search_suppliers, associated_against: { supplier: [:id] }, using: { tsearch: { any_word: true } }
  pg_search_scope :search_items, associated_against: { items: [:id] }, using: { tsearch: { any_word: true } }
  pg_search_scope :search_creator, associated_against: { user: [:first_name, :last_name, :username] }, using: { tsearch: { prefix: true, any_word: true } }
  
  def approved?
    status == 'Approved'
  end

  def self.text_search(*query)
    if query.present?
      search(query)
    else
      scoped
    end
  end

  def self.get_sum_of_poitems(items)
    total = if items.present? && self.search_items(items).length > 0
      self.search_items(items).map { |po| po.purchase_order_items.poi_search(items).pluck(:total_amount) }.sum.sum
    else
      0.00
    end
    total
  end

  def self.dynamic_search(po_num, suppliers, branches, items, status, creator )
    keywords = "all#{po_num == '' ? '' : '.search_po_number(po_num)'}#{suppliers.present? ? '.search_suppliers(suppliers)' : ''}#{branches.present? ? '.search_branches(branches)' : ''}#{items.present? ? '.search_items(items)' : ''}#{status == '' ? '' : '.search_status(status)'}#{creator == '' ? '' : '.search_creator(creator)'}"
		eval(keywords)
  end

end
