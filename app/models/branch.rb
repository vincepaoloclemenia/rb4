class Branch < ActiveRecord::Base
  belongs_to :brand
  has_many :sales
  has_many :employees
  has_many :inventories, dependent: :restrict_with_error
  has_many :purchases

	validates :name,
						presence: true,
						length: {
							maximum: 50
						},
            uniqueness: { scope: :brand_id, message: "already exist", case_sensitive: false }
end
