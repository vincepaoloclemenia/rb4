class Statistic < ActiveRecord::Base
    belongs_to :client
    validates :name, presence: true, uniqueness: true
end