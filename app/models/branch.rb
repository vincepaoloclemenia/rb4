class Branch < ActiveRecord::Base
  belongs_to :brand
  has_many :sales
  has_many :employees

	validates :name,
						presence: true,
						length: {
							maximum: 50
						}
end
