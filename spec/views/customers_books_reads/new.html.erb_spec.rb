require 'spec_helper'

describe "customers_books_reads/new" do
  before(:each) do
    assign(:customers_books_read, stub_model(CustomersBooksRead,
      :customer_id => 1,
      :book_id => 1
    ).as_new_record)
  end

  it "renders new customers_books_read form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customers_books_reads_path, "post" do
      assert_select "input#customers_books_read_customer_id[name=?]", "customers_books_read[customer_id]"
      assert_select "input#customers_books_read_book_id[name=?]", "customers_books_read[book_id]"
    end
  end
end
