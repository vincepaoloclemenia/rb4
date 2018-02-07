class User < ActiveRecord::Base
  
  has_one :client_user_access, dependent: :destroy
  has_one :role, through: :client_user_access
  has_one :client, through: :client_user_access
  has_one :brand, through: :client_user_access
  has_one :branch, through: :client_user_access
  has_many :activities, dependent: :destroy
  has_many :purchase_orders, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :authentication_keys => [:login], :timeout_in => 1.hours

  attr_accessor :login

  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "35x35>" }, :default_url => "/img/male-placeholder.png"
  validates_attachment :avatar,
                       :content_type => { :content_type => /^image\/(png|gif|jpeg|jpg)/, message: "must be in the format png|gif|jpg" },
                       :size => { :in => 0..1000.kilobytes, message: "must be less than 1MB" }

  validates :username,
            presence: true,
            uniqueness: {
              case_sensitive: false
            },
            format: {
              with: /\A[a-zA-Z0-9_\.]*\z/
            }
  validate :validate_username
  validates :email,
            presence: true
  # validates :first_name,
  #           presence: true,
  #           length: {
  #             maximum: 50
  #           }
  # validates :last_name,
  #           presence: true,
  #           length: {
  #             maximum: 50
  #           }

  accepts_nested_attributes_for :client_user_access

  def full_name
    "#{first_name} #{last_name}"
  end

  def validate_username
  	if User.where(email: username).exists?
  		errors.add(:username, :invalid)
  	end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	  else
	    if conditions[:username].nil?
	      where(conditions).first
	    else
	      where(username: conditions[:username]).first
	    end
	  end
  end

  def self.branch_users(branch)
    all.joins(:branch).map { |user| user.branch.id == branch.id ? user : next }.compact
  end

  def self.brand_users(brand)
    all.joins(:brand).map { |user| user.brand.id == brand.id ? user : next }.compact
  end

  def self.users_by_roles(name)
    if name == 'branch'
      all.joins(:role, :branch).order('branches.name ASC').map { |user| user.role.role_level == name ? user : next }.compact
    elsif name == 'brand'
      all.joins(:role, :brand).order('brands.name ASC').map { |user| user.role.role_level == name ? user : next }.compact
    elsif name == 'client'
      all.joins(:role, :client).order('clients.name ASC').map { |user| user.role.role_level == name ? user : next }.compact
    end
  end

end
