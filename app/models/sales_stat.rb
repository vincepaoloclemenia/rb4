class SalesStat < ActiveRecord::Base
    belongs_to :sale
    belongs_to :statistic
    belongs_to :branch
end