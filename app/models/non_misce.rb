class NonMisce < ActiveRecord::Base
    belongs_to :client
    validates :name, presence: true, uniqueness: true
    scope :active, -> { where is_active: true }
    scope :inc, -> { where percentage_scope: true }
    scope :exc, -> { where.not percentage_scope: true }
end