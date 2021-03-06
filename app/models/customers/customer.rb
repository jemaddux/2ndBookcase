class Customer < ActiveRecord::Base
  has_secure_password
  has_many :reading_lists
  has_one :plan
  has_many :subscriptions

  attr_accessible :email, :password, :password_confirmation, :plan_id,
                  :first_name, :last_name, :email, :street_address, :city,
                  :state, :zipcode, :account_status

  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :street_address, :city,
                        :state, :zipcode

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
    customer.plan_id = params["customer"]["plan_id"]
    customer
  end

  def reading_list_books
    remove_duplicates_in_list
    reading_list_items = Customer.find(id).reading_lists.where(in_list: true, out_on_loan: false)
    book_ids = reading_list_items.map {|item| item.book_id}
    Book.where(id: book_ids)
  end

  def reading_list_books_out_on_loan
    remove_duplicates_in_list
    reading_list_items = Customer.find(id).reading_lists.where(in_list: true, out_on_loan: true)
    book_ids = reading_list_items.map {|item| item.book_id}
    Book.where(id: book_ids)
  end

private

  def remove_duplicates_in_list
    reading_list_items = Customer.find(id).reading_lists.where(in_list: true)
    items = []
    reading_list_items.shuffle.each do |rl_item|
      if items.include? rl_item.book_id
        if rl_item.out_on_loan == false
          item = ReadingList.find(rl_item.id)
          item.delete
        end
      else
        items << rl_item.book_id
      end
    end
  end
end



















