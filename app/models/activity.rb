class Activity < ActiveRecord::Base
    belongs_to :brand
    belongs_to :user

    belongs_to :recordable, polymorphic: true
    validates_presence_of :brand_id, :user_id, :action
    default_scope -> { order(created_at: :desc) }

    def self.destroy_record
        all.map { |a| a.recordable.nil? ? a.destroy : next }
    end

end
