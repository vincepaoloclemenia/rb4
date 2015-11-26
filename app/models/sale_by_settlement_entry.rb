class SaleBySettlementEntry < ActiveRecord::Base
  belongs_to :settlement
  belongs_to :sale
end
