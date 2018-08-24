class Client < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged
	has_many :client_user_accesses
	has_many :users, through: :client_user_accesses
	has_many :brands
	has_many :branches, through: :brands, source: :branches
	has_many :roles
	has_many :settlements
	has_many :employees, through: :branches
	has_many :suppliers
	has_many :purchases
	has_many :purchase_items, through: :purchases
	has_many :subscriptions, dependent: :destroy
	has_many :bills, through: :subscriptions
	has_one :setting, dependent: :destroy
	has_many :purchase_orders, dependent: :destroy
	has_many :order_lists, through: :brands, dependent: :destroy
	has_many :revenues, dependent: :destroy
	has_many :statistics, dependent: :destroy
	has_many :non_misces, dependent: :destroy

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "35x35>" }, :default_url => "/img/brand.png"
	validates_attachment :avatar, 
						 :content_type => { :content_type => /^image\/(png|gif|jpeg|jpg)/, message: "must be in the format png|gif|jpg" },
						 :size => { :in => 0..1000.kilobytes, message: "must be less than 1MB" }

	validates :name,
						presence: true,
						length: {
							maximum: 50
						}

	after_create :create_initial_role, :create_initial_setting

	def trial
		subscriptions.find_by_plan_id(1)
	end

	def free_trial? 
		trial.free_trial
	end

	def subscribed_branches
		branches.includes(:branch_subscription).where.not( branch_subscriptions: { branch_id: nil })
	end

	#def branches
	#	if on_free_trial?
	#		branches
	#	else
	#		branches.includes(:branch_subscription).where.not( branch_subscriptions: { branch_id: nil })
	#	end
	#end

	def unsubscribed_branches
		branches.includes(:branch_subscription).where( branch_subscriptions: { branch_id: nil })
	end

	def cancelled_branches
		branches.includes(:branch_subscription).where( branch_subscriptions: { active: false })  		
	end

	def on_free_trial?
		free_trial? && trial.end_date >= Date.today
	end

	def free_trial_expired?
		free_trial? && trial.end_date <= Date.today
	end

	def manual_payment_token(date)
		for_subs = date || Date.today
		id = Subscription.maximum(:id) || 1
		token = "%03d" % id
		date_of_subs = for_subs.strftime("%m%d%y")
		return "#{slug.upcase}#{token}#{date_of_subs}"
	end

	def has_paid_subscription?
		subscriptions.find_by_plan_id(2).present? && ( subscriptions.where( plan_id: 2 ).map{ |subs| subs.payment_provided? } ).include?(true)
	end 

	def has_unpaid_subscriptions?
		subscriptions.where(plan_id: 2).map { |subs| subs.end_date >= Date.today }.exclude? true
	end

	def has_subscribed? 
		subscriptions.find_by_plan_id(2).present?
	end

	def not_subscribed_yet?
		!has_subscribed?
	end

	def self.subscribers
		all.includes(:subscriptions).where.not( subscriptions: { plan_id: 1, client_id: nil })
	end

	def self.free_trials
		all.includes(:subscriptions).where( subscriptions: { plan_id: 1 })
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