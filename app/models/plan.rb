class Plan < ActiveRecord::Base
  has_many :customers
  has_many :subscriptions

  attr_accessible :description, :cost
end
