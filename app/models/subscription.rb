class Subscription < ActiveRecord::Base
  belongs_to :client
  belongs_to :plan
  has_many :bills
  has_many :branch_subscriptions, dependent: :destroy
  has_many :branches, through: :branch_subscriptions
  has_many :payment_notifications
  scope :paid_subscriptions, -> { where plan_id: 2 }

  def self.free_trial
    find_by_status_and_plan_id("Active", 1)
  end

  def self.except_free_trial
    where("plan_id != ?", 1)
  end

  def paypal
    PaypalPayment.new(self)
  end

  def payment_provided?
    paypal_payment_token.present?
  end

  def save_with_payment
    if valid?
      if payment_provided?
        save_with_paypal_payment
      else
        errors.add("No payment provided yet.", " Sorry, your transaction cannot be completed.")
      end
    else
      errors.add("Invalid", " details. Transaction cannot be completed.")
    end
  end

  def request_pay
    res = paypal.ask_payment
    #res.approved? && res.completed?
      
  end

  def save_with_paypal_payment
    response = paypal.make_recurring
    self.paypal_recurring_profile_token = response.profile_id
    self.paypal_email = self.paypal.checkout_details.email
    self.status = "Active"
    self.start_date = DateTime.now.in_time_zone('Pacific Time (US & Canada)')
    self.end_date = DateTime.now.in_time_zone('Pacific Time (US & Canada)') + 1.month
    save!
  end

  def update_with_payment
    if valid?
      if payment_provided?
        update_with_paypal_payment
      else
        errors.add("No payment provided yet.", " Sorry, your transaction cannot be completed.")
      end
    else
      errors.add("Invalid", " details. Transaction cannot be completed.")
    end
  end

  def update_with_paypal_payment
    response = paypal.update_recurring
  end

  # Remove subscription of branches with 'Cancelled' subscription
  def self.process_cancelled_subscriptions
    subscriptions = Subscription.where(status: "Cancelled").where("end_date >= ?", DateTime.now)
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
    subscriptions = Subscription.where(plan_id: 1).where("end_date >= ?", DateTime.now)
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

  def cancelled?
    status == "Cancelled"
  end

  def is_processing?
    status == "Processing"
  end
end
