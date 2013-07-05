class Book < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :inventories
  belongs_to :reading_list
end
