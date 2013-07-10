module ApplicationHelper
  def find_book(id)
    @book ||= Book.find(id)
  end

  def find_plan(id)
    @plan ||= Plan.find(id)
  end

end
