class ReadingListsController < ApplicationController
  def create
    @reading_list_item = ReadingList.create_list_item(params)
    @reading_list_item.save

    return false
  end

  def update
    current_customer.reading_lists.each do |list_item|
      if book_to_be_removed?(list_item)
        list_item.in_list = false
        list_item.save
      end
    end
    redirect_to :back
  end

private
  def book_to_be_removed?(list_item)
    list_item.book_id == params["book_id"].to_i && list_item.loan_out_date == nil
  end
end
