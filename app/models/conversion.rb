class Conversion < ActiveRecord::Base
  belongs_to :brand
  belongs_to :unit
  belongs_to :to, class_name: "Unit", foreign_key: "to_unit_id"
  belongs_to :from, class_name: "Unit", foreign_key: "from_unit_id"

  validates :to_unit_id, :from_unit_id, :factor, presence: true
end
