class NonMisce < ActiveRecord::Base
    belongs_to :client
    belongs_to :parent, class_name: 'NonMisce'
    has_many :sub_non_misces, class_name: "NonMisce", foreign_key: :parent_id, dependent: :destroy
    validates :name, presence: true, uniqueness: true
    scope :active, -> { where is_active: true }
    scope :inc, -> { where percentage_scope: true }
    scope :exc, -> { where.not percentage_scope: true }
    scope :main, -> { where parent_id: nil }

    def is_sub_non_misce?
        parent_id.present?
    end
end