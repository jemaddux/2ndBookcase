module ApplicationHelper
  def find_book(id)
    @book ||= Book.find(id)
  end

  def find_plan(id)
    @plan ||= Plan.find(id)
  end

  def available_inventory(book_id)
    @inventory = Inventory.where(book_id: book_id, checked_out: false)
  end
end
