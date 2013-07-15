class Subscription < ActiveRecord::Base
  belongs_to :customer
  belongs_to :plan

  validates_presence_of :customer_id, :plan_id, :stripe_card_token

  attr_accessible :plan_id, :customer_id, :stripe_card_token,
                  :stripe_customer_token

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: customer_id,
                          plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
  end
end
