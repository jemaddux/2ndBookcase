class ReadingList < ActiveRecord::Base
  belongs_to :customer
  has_one :book
  has_one :inventory

  def self.create_list_item(params)
    rl_item = ReadingList.new
    rl_item.customer_id = params["customer_id"]
    rl_item.inventory_id = nil
    rl_item.book_id = params["book_id"]
    rl_item.loan_out_condition = nil
    rl_item.returned_condition = nil
    rl_item.loan_out_date = nil
    rl_item.returned_date = nil
    rl_item.out_on_loan = false
    rl_item.save!
  end
end
