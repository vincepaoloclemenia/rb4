class Client < ActiveRecord::Base
	has_many :client_user_accesses
	has_many :users, through: :client_user_accesses
	has_many :brands
	has_many :all_branches, through: :brands, class_name: 'Branch', source: :all_branches
	has_many :roles
	has_many :settlements
	has_many :employees, through: :all_branches
	has_many :suppliers
	has_many :purchases
	has_many :purchase_items, through: :purchases
	has_one :subscription
	has_many :bills, through: :subscription
	has_one :setting, dependent: :destroy
	has_many :purchase_orders, dependent: :destroy
	has_many :order_lists, through: :brands, dependent: :destroy

	validates :name,
						presence: true,
						length: {
							maximum: 50
						}

	after_create :create_initial_role, :create_initial_setting

	def free_trial? 
		subscription.plan_id == 1
	end

	def branches
		if on_free_trial?
			all_branches
		else
			all_branches.includes(:branch_subscription).where.not( branch_subscriptions: { branch_id: nil })
		end
	end

	def unsubscribed_branches
		all_branches.includes(:branch_subscription).where( branch_subscriptions: { branch_id: nil })
	end

	def on_free_trial?
		free_trial? && subscription.end_date >= Date.today
	end

	def free_trial_expired?
		free_trial? && subscription.end_date <= Date.today
	end

	def has_paid_subscription?
		subscription.plan_id == 2 && subscription.payment_provided?
	end 

	def unpaid_subscription?
		subscription.plan_id != 1 && subscription.payment_provided? && subscription.end_date <= Date.today		
	end

	def has_subscribed? 
		subscription.plan_id == 2
	end

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