class Brand < ActiveRecord::Base
  belongs_to :client
  has_many :branches

	validates :name,
						presence: true,
						length: {
							maximum: 50
						}

  accepts_nested_attributes_for :branches
end
