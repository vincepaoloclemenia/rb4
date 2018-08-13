class NonMisce < ActiveRecord::Base
    belongs_to :client
    validates :name, presence: true, uniqueness: true
    scope :active, -> { where is_active: true }
    
end