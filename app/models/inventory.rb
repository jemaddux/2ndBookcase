class Inventory < ActiveRecord::Base
  belongs_to :book

  attr_accessible :book_id, :condition, :checked_out, :in_circulation

  def retired?
    in_circulation == false
  end
end
