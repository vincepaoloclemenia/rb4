class Supplier < ActiveRecord::Base
  belongs_to :brand
  belongs_to :client
  belongs_to :branch
  has_and_belongs_to_many :items
  validates :client_id, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false, message: ' already exists' }
  default_scope -> { order(name: :asc) }
  scope :not_deleted, -> { where(is_deleted: false) }

  before_save :capitalize_name

  def capitalize_name
    name.capitalize!
  end

end
