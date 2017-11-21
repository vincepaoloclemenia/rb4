class Activity < ActiveRecord::Base
    belongs_to :brand
    belongs_to :user
    validates_presence_of :brand_id, :user_id, :action
    default_scope -> { order(created_at: :desc) }
end
