class Client < ActiveRecord::Base
	has_many :client_user_accesses
	has_many :users, through: :client_user_accesses
	has_many :brands
	has_many :branches, through: :brands
	has_many :roles
	has_many :settlements
	has_many :employees, through: :branches
	has_many :suppliers
	has_many :purchases
	has_many :purchase_items, through: :purchases
	has_one :setting, dependent: :destroy

	validates :name,
						presence: true,
						length: {
							maximum: 50
						}

	after_create :create_initial_role, :create_initial_setting

	private

	def create_initial_role
		roles.create(name: "Company Administrator", description: "Client Administrators have the full access to the whole company", role_level: "client")
		roles.create(name: "Brand Administrator", description: "Brand Administrators can manage the only brand assigned to them", role_level: "brand")
		roles.create(name: "Branch Administrator", description: "Branch Administrators can manage the only branch assigned to them", role_level: "branch")
	end

	def create_initial_setting
		Setting.create(client_id: self.id)
	end
end