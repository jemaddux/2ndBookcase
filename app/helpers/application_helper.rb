module ApplicationHelper
  def find_book(id)
    @book = Book.find(id)
  end

end
