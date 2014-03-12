require 'spec_helper'

describe "customers_books_reads/edit" do
  before(:each) do
    @customers_books_read = assign(:customers_books_read, stub_model(CustomersBooksRead,
      :customer_id => 1,
      :book_id => 1
    ))
  end

  it "renders the edit customers_books_read form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customers_books_read_path(@customers_books_read), "post" do
      assert_select "input#customers_books_read_customer_id[name=?]", "customers_books_read[customer_id]"
      assert_select "input#customers_books_read_book_id[name=?]", "customers_books_read[book_id]"
    end
  end
end
