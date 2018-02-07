class PurchaseOrder < ActiveRecord::Base
  belongs_to :user
	belongs_to :client
  belongs_to :brand
  belongs_to :branch
  belongs_to :supplier
  has_many :purchase_order_items, dependent: :destroy
	# belongs_to :created_by, class_name: 'User', :foreign_key => 'user_created_by_id'
 #  belongs_to :modified_by, class_name: 'User', foreign_key: 'user_modified_by_id'
  scope :approved_pos, ->  { where status: 'Approved' }
  scope :new_pos, -> { where status: 'Pending' }
  scope :on_hold_pos, -> { where status: 'On Hold' }
  scope :rejected_pos, -> { where status: 'Rejected' }
  accepts_nested_attributes_for :purchase_order_items,  :reject_if => :all_blank, :allow_destroy => :true

  # validates :invoice_number, :pr_date, :supplier_id, :brand_id, :branch_id, presence: true

end
