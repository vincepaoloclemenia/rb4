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

  accepts_nested_attributes_for :purchase_order_items,  :reject_if => :all_blank, :allow_destroy => :true
  
  validates :delivery_date, :delivery_time, presence: true, if: :approved?

  pg_search_scope :search, against: { :po_date => 'A', :po_number => 'B', :status => 'C' },
    associated_against: { 
      branch: [:name],
      user: [:first_name, :last_name],
      items: [:name],
      supplier: [:name]
    }, using: { tsearch: { prefix: true, any_word: true } }
  
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

end
