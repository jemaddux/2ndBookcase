class ReadingListsController < ApplicationController
  def create
    @reading_list_item = ReadingList.create_list_item(params)
    @reading_list_item.save
  end
end
