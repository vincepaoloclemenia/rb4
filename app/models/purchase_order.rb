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

  pg_search_scope :search, against: { :po_number => 'A', :po_date => 'B', :status => 'C' },
    associated_against: { 
      branch: [:name],
      user: [:first_name, :last_name],
      items: [:id],
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

  def self.items_search(*query)
    if query.present?
      search(query)
    else
      scoped
    end
  end

  def self.get_sum_of_poitems(*keywords)
    total = if keywords.present? && self.items_search(keywords).length > 0
      sum = self.items_search(keywords).map { |po| po.purchase_order_items.poi_search(keywords).pluck(:total_amount) }.sum
      sum.sum
    else
      0.00
    end
    total
  end

  def self.dynamic_search(from, to, things, branches, suppliers, estado, maker, po_num)
    searched_items = things.present? ? things : ''
    searched_branches = branches.present? ? branches : ''   
    searched_suppliers = suppliers.present? ? suppliers : ''
    searched_status = estado.present? ? estado : ''
    searched_creator = maker.present? ? maker : ''
    searched_po = po_num.present? ? po_num : ''
    keywords = "#{searched_branches} #{searched_suppliers} #{searched_status} #{searched_creator} #{searched_po} #{searched_items}"
    purchase_orders = if from.present? && to.present? && !( things.present? || branches.present? || suppliers.present? || maker.present? || estado.present? || po_num.present? )
      date_from = Date.strptime(from, '%m/%d/%Y')   
      date_to = Date.strptime(to, '%m/%d/%Y')          
      where(po_date: date_from..date_to)
    elsif from.present? && to.present? && ( things.present? || branches.present? || suppliers.present? || maker.present? || estado.present? || po_num.present? )
      date_from = Date.strptime(from, '%m/%d/%Y')   
      date_to = Date.strptime(to, '%m/%d/%Y')   
      if where(po_date: date_from..date_to).exists?
        where(po_date: date_from..date_to).text_search(keywords)
      else
          []
      end
    elsif !(from.present? && to.present?) && ( things.present? || branches.present? || suppliers.present? || maker.present? || estado.present? || po_num.present? )
        text_search(keywords)
    end
  end

end
