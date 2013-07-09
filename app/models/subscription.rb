class Subscription < ActiveRecord::Base
  belongs_to :customer
  has_one :plan

end
