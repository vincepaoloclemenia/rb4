class Client < ActiveRecord::Base
	has_many :client_user_accessses
	has_many :users, through: :client_user_accessses
	has_many :brands
	has_many :branches, through: :brands
	has_many :roles

	after_create :create_initial_role

	private
	def create_initial_role
		roles.create(:name => "Client Administrator", :description => "This is the Client Administrator role", :role_level => "client")
	end
end
