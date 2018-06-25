class BranchPurchaseOrderSetup < ActiveRecord::Base
    belongs_to :branch
    validates_presence_of :delivery_from, :delivery_to

    validate :validate_time_range

    def validate_time_range
        if (delivery_from.blank? || delivery_to.blank?)
            errors.add("Invalid:", " Time range cannot be blank.")
        else
            if (delivery_from.to_time > delivery_to.to_time)
                errors.add("Invalid", " time range.")
            end
        end
    end

end
