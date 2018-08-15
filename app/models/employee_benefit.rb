class EmployeeBenefit < ActiveRecord::Base
    has_many :benefits
    belongs_to :brand
    validates :name, presence: true, uniqueness: true
end
