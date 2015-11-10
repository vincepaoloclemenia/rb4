class Brand < ActiveRecord::Base
  belongs_to :client
  has_many :branches

  accepts_nested_attributes_for :branches
end
