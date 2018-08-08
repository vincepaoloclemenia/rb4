class SalesRevenue < ActiveRecord::Base
    belongs_to :sale
    belongs_to :sales_revenue
    belongs_to :branch
end