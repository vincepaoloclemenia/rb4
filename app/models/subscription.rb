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

  # Remove subscription of branches with 'Cancelled' subscription
  def self.process_cancelled_subscriptions
    subscriptions = Subscription.where(status: "Cancelled").where("next_payment >= ?", DateTime.now)
    if subscriptions.empty?
      puts "======== No 'Cancelled' subscriptions Found for today ========"
    else
      puts "======== Processing 'Cancelled' Subscriptions ========"
    end
    subscriptions.each do |subscription|
      puts "======== Subscription##{subscription.id} ========"
      subscription.branches.each do |branch|
        puts "======== Subscription##{subscription.id} and Branch##{branch.id} ========"
        branch.update_attributes(subscription_id: nil)
      end
      subscription.update_attributes(status: "Unsubscribed")
      puts "======== Subscription##{subscription.id} updated to 'Unsubscribed' ========"
    end
    puts "======== Processing Complete ========" unless subscriptions.empty?
  end

  # Change expired free trial subscription
  def self.process_free_trial_subscriptions
    subscriptions = Subscription.where(plan_id: 1).where("next_payment >= ?", DateTime.now)
    if subscriptions.empty?
      puts "======== No 'Expired' subscriptions found today ========"
    else
      puts "======== Processing 'Expired' Subscriptions ========"
    end
    subscriptions.each do |subscription|
      subscription.branches.each do |branch|
        puts "======== Subscription##{subscription.id} and Branch##{branch.id} ========"
        branch.update_attributes(subscription_id: nil)
      end
      subscription.update_attributes(status: "Expired")
      puts "======== Subscription##{subscription.id} updated to 'Expired' ========"
    end
    puts "======== Processing Complete ========" unless subscriptions.empty?
  end
end
