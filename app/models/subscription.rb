class Subscription < ActiveRecord::Base
  belongs_to :client
  belongs_to :plan
  has_many :bills
  has_many :branch_subscriptions, dependent: :destroy
  has_many :branches, through: :branch_subscriptions
  has_many :payment_notifications

  def save_with_payment
    if valid?
      if paypal_payment_token.present?
        save_with_paypal_payment
      end
    end
  end

  def paypal
    PaypalPayment.new(self)
  end

  def save_with_paypal_payment
    response = paypal.make_recurring
    self.paypal_recurring_profile_token = response.profile_id
    self.paypal_email = self.paypal.checkout_details.email
    self.status = "Processing"
    # self.start_date = DateTime.now
    # case self.plan_id
    # when 2
    #   self.end_date = DateTime.now + 1.month
    # when 3
    #   self.end_date = DateTime.now + 1.year
    # else
    # end

    save!
  end

  def payment_provided?
    paypal_payment_token.present?
  end
end
