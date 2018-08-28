class TaxType < ActiveRecord::Base
    belongs_to :brand
    belongs_to :branch
    
end