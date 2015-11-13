class User < ActiveRecord::Base

  has_one :client_user_access, dependent: :destroy
  has_one :role, through: :client_user_access
  has_one :client, through: :client_user_access
  has_one :brand, through: :client_user_access
  has_one :branch, through: :client_user_access
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :authentication_keys => [:login], :timeout_in => 1.hours

  attr_accessor :login

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

  after_create :create_client_user_access

  def full_name
    "#{first_name} #{last_name}"
  end

  def create_client_user_access
    ClientUserAccess.create user_id: id
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
end
