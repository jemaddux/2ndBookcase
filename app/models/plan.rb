class Plan < ActiveRecord::Base
  has_many :customers
  has_many :subscriptions
end
