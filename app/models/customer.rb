class Customer < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation

  validates_uniqueness_of :email

  def self.create_customer(params)
    customer = Customer.new
    customer.password = params["customer"]["password"]
    customer.password_confirmation = params["customer"]["password_confirmation"]
    customer.email = params["customer"]["email"].downcase
    customer.first_name = params["customer"]["first_name"]
    customer.last_name = params["customer"]["last_name"]
    customer.street_address = params["customer"]["street_address"]
    customer.city = params["customer"]["city"]
    customer.state = params["customer"]["state"]
    customer.zipcode = params["customer"]["zipcode"]
    customer.account_status = "pending payment method"
    customer.rental_plan = params["customer"]["rental_plan"]
    customer
  end
end
