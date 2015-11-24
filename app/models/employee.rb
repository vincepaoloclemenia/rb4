class Employee < ActiveRecord::Base
  belongs_to :branch
  belongs_to :employee_type
  delegate :brand, to: :branch


  def full_name
  	if first_name.present? && last_name.present?
  		first_name + " " + last_name
  	else
  		first_name
  	end
  end
end
