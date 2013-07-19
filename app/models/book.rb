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

private

  def self.first_available_inventory(book_id)
    @inventory = Inventory.where(book_id: book_id, checked_out: false, in_circulation: true).first
  end
end
