class SalesNonMisce < ActiveRecord::Base
    belongs_to :sale
    belongs_to :branch
    belongs_to :non_miscelaneous
end