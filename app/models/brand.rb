class Brand < ActiveRecord::Base
  belongs_to :client
  has_many :branches
  has_many :client_user_accesses										# => for rescue purposes, associated roles and branches
  has_many :roles, through: :client_user_accesses		# => for rescue purposes, associated roles and branches
  has_many :categories
  has_many :shifts
  has_many :sales, through: :branches
  has_many :units
  has_many :items
  has_many :inventories, through: :branches, dependent: :restrict_with_error

	validates :name,
						presence: true,
						length: {
							maximum: 50
						}

  accepts_nested_attributes_for :branches
end
