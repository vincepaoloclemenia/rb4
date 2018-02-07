class OrderList < ActiveRecord::Base
	belongs_to :supplier
	belongs_to :user
	belongs_to :branch
end
