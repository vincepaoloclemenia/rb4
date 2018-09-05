class Statistic < ActiveRecord::Base
    belongs_to :client 
    validates :name, presence: true, uniqueness: true
    scope :active, -> { where is_active: true }   
    scope :no_transactions, -> { where non_transac: false }
end