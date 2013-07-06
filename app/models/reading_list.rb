class ReadingList < ActiveRecord::Base
  belongs_to :customer
  has_one :book
  has_one :inventory

  def self.create_list_item(params)

  end
end
