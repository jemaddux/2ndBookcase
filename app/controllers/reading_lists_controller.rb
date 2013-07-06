class ReadingListsController < ApplicationController
  # POST /reading_lists
  # POST /reading_lists.json

  def create
    @reading_list_item = ReadingList.create_list_item(params)
    @reading_list_item.save

    # redirect_to "#"
  end

  # def create
  #   @book = Book.new(book_params)

  #   respond_to do |format|
  #     if @book.save
  #       format.html { redirect_to @book, notice: 'Book was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @book }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @book.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

end
