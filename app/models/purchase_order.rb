class PurchaseOrder < ActiveRecord::Base
  include PgSearch
  belongs_to :user
	belongs_to :client
  belongs_to :brand
  belongs_to :branch
  belongs_to :supplier
  has_many :purchase_order_items, dependent: :destroy
  has_many :items, through: :purchase_order_items, dependent: :destroy

  default_scope -> { where.not(supplier_id: nil).order(created_at: :desc) }
  scope :approved_pos, ->  { where status: 'Approved' }
  scope :new_pos, -> { includes(:purchase_order_items).where( status: 'Pending' ).where.not( purchase_order_items: { purchase_order_id: nil } ) }
  scope :on_hold_pos, -> { where status: 'On Hold' }
  scope :rejected_pos, -> { where status: 'Rejected' }
  scope :no_delivery_date, -> { where delivery_date: nil, delivery_time: nil, status: 'On Hold' }
  scope :sent_purchase_orders, -> { where sent: true, status: 'Approved' }
  scope :unsent_pos, -> { includes(:purchase_order_items).where(sent: false, status: ["Approved", "Pending"]).where.not( purchase_order_items: { purchase_order_id: nil } ) }

  accepts_nested_attributes_for :purchase_order_items,  :reject_if => :all_blank, :allow_destroy => :true
  
  validates :delivery_address, :delivery_time, :delivery_time_to, presence: true
  before_save :check_if_restricted?, if: :branch_user?
  validate :validate_date, on: :update
  validate :time_range

  pg_search_scope :search_po_number, against: [ :po_number ], using: { tsearch: { prefix: true, any_word: true } }
  pg_search_scope :search_status, against: [ :status ]  
  pg_search_scope :search_branches, associated_against: { branch: [:id] }, using: { tsearch: { any_word: true } }
  pg_search_scope :search_suppliers, associated_against: { supplier: [:id] }, using: { tsearch: { any_word: true } }
  pg_search_scope :search_items, associated_against: { items: [:id] }, using: { tsearch: { any_word: true } }
  pg_search_scope :search_creator, associated_against: { user: [:first_name, :last_name, :username] }, using: { tsearch: { prefix: true, any_word: true } }
  
  def approved?
    status == 'Approved'
  end

  def branch_user?
    self.user.role.role_level == 'branch'
  end

  def check_if_restricted?
    if brand.restrict_branch_admins?
      errors.add("Sorry", " , adding of Purchase Order cannot be completed.")
    end
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

  def self.all_unpurchased_orders
    all.where(saved_as_purchase: false)
  end

  def valid_date?
    if delivery_date.nil?
      return false
    else
      del_dd = Proc.new do |dd|
        begin
          dd.strftime("%B %d, %Y")
          return true
        rescue ArgumentError
          false
        end
      end
      return del_dd.call(delivery_date)
    end
  end

  def valid_time?
    if delivery_time.nil?
      return false
    else
      return delivery_time.to_time.present?
    end
  end

  def validate_date
    errors.add("Invalid", " date") unless delivery_date != '' || valid_date?
  end

  def time_range
    if delivery_time && delivery_time_to
      if delivery_time.to_time > delivery_time_to.to_time
        errors.add("Invalid", " delivery time range")
      end
    end
  end

  def send_single_purchase_order(subject, contact, recipients, contact_title, body)
    if recipients.reject { |c| c.empty? }.size >= 1 && subject 
      recipients.map do |recipient|
        if recipient == ''
          next
        else
          UserMailer.send_purchase_order(
            self, 
            self.purchase_order_items, 
            self.user,
            recipient,
            subject,
            contact,
            contact_title,
            body
          ).deliver_now
          self.update(date_sent: DateTime.now, sent: true)
        end
      end	
      true
    else
      errors.add("Something went wrong.", " Email cannot be submitted due to incomplete information. Please check recipients and subject before sending.")
      false
    end
  end

end
