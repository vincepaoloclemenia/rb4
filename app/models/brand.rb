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
  has_many :suppliers

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "35x35>" }, :default_url => "/img/brand2.png"
  validates_attachment :avatar, 
                       :content_type => { :content_type => /^image\/(png|gif|jpeg|jpg)/, message: "must be in the format png|gif|jpg" },
                       :size => { :in => 0..1000.kilobytes, message: "must be less than 1MB" }

	validates :name,
						presence: true,
						length: {
							maximum: 50
						}

  accepts_nested_attributes_for :branches
end
