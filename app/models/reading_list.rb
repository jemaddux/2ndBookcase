class ReadingList < ActiveRecord::Base
  belongs_to :customer
  has_one :book
  has_one :inventory
end
