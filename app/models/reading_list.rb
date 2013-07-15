class ReadingList < ActiveRecord::Base
  belongs_to :customer
  has_one :book
  has_one :inventory

  attr_accessible :customer_id, :inventory_id, :book_id, :loan_out_condition,
                  :returned_condition, :loan_out_date, :returned_date,
                  :out_on_loan, :in_list

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
    rl_item
  end
end
