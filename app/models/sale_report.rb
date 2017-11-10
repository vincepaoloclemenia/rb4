class SaleReport < ActiveRecord::Base
    belongs_to :user
    belongs_to :brand

    validates :title, presence: true, uniqueness: true
    validates_presence_of :from, :to, :user_id

end
