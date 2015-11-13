class Role < ActiveRecord::Base
	has_many :client_user_accesses
  belongs_to :client
  has_many :users, through: :client_user_accesses
  has_many :permissions, dependent: :destroy
  has_many :sections, through: :permissions

  accepts_nested_attributes_for :permissions

  after_create :create_initial_permissions

	validates :name,
						presence: true,
						length: {
							maximum: 50
						}

	private

	def create_initial_permissions
		Section.all.each do |section|
			if role_level == "client"
				is_create = true
				is_update = true
				is_destroy = true
			else
				is_create = false
				is_update = false
				is_destroy = false
			end
			permissions.create(client_id: client.id, 
									section_id: section.id,
									is_create: is_create,
									is_read: true,
									is_update: is_update,
									is_destroy: is_destroy)
		end
	end
end