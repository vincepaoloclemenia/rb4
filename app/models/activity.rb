class Activity < ActiveRecord::Base
    belongs_to :brand
    belongs_to :user
end
