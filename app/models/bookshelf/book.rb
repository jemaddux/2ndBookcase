class Book < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :inventories
  belongs_to :reading_list

  attr_accessible :name, :description, :rating, :times_rated, :author
  validates_presence_of :name, :description, :author

  def self.checkout_book(params)
    inventory = first_available_inventory(params["book_id"])
    inventory.checked_out = true
    inventory.save

    reading_list = ReadingList.find(params["reading_list_id"])
    reading_list.loan_out_date = Date.today
    reading_list.loan_out_condition = inventory.condition
    reading_list.inventory_id = inventory.id
    reading_list.out_on_loan = true
    reading_list.save
  end

  def self.check_in_book(params)
    i = Inventory.find(params[:inventory_id])
    i.checked_out = false
    i.condition = params[:returned_condition]
    i.in_circulation = false if params[:returned_condition] == "retired"
    i.save

    rl_dataset = ReadingList.where(out_on_loan: true)
    rl = rl_dataset.find_by_inventory_id(params[:inventory_id])

    rl.returned_date = Date.today
    rl.out_on_loan = false
    rl.in_list = false
    if params[:returned_condition]
      rl.returned_condition = params[:returned_condition]
    else
      rl.returned_condition = rl.loan_out_condition
    end
    rl.save
  end

private

  def self.first_available_inventory(book_id)
    @inventory = Inventory.where(book_id: book_id, checked_out: false, in_circulation: true).first
  end
end
