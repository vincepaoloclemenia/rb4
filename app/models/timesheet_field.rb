class TimesheetField < ActiveRecord::Base
  belongs_to :brand
  validates :name, presence: true, uniqueness: true
end
