class SaleReport < ActiveRecord::Base
    belongs_to :brand
    
    validates_presence_of :date_from, :date_to, :title

end
