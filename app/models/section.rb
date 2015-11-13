class Section < ActiveRecord::Base
	belongs_to :role
	has_many :permissions, dependent: :destroy

	after_create :create_permissions_for_all_roles
	private

	def create_permissions_for_all_roles
		Role.all.each do |role|
			if role.role_level == "client"
				is_create = true
				is_update = true
				is_destroy = true
			else
				is_create = false
				is_update = false
				is_destroy = false
			end
			role.permissions.create(client_id: role.client.id,
															section_id: id,
															is_create: is_create,
															is_read: true,
															is_update: is_update,
															is_destroy: is_destroy)
		end
	end
end
