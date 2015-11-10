class Branch < ActiveRecord::Base
  belongs_to :brand

	validates :name,
						presence: true,
						length: {
							maximum: 50
						}
end
