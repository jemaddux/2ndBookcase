class ReadingListsController < ApplicationController
  def create
    book_ids = current_customer.reading_lists.where(in_list: true).map {|rl| rl.book_id}
    unless book_ids.include? params["book_id"]
      @reading_list_item = ReadingList.create_list_item(params)
      @reading_list_item.save
    end

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
