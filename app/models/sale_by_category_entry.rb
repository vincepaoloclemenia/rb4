class SaleByCategoryEntry < ActiveRecord::Base
  belongs_to :sale
  belongs_to :category
end
