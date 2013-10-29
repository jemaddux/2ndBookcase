require 'spec_helper'

describe "customers_books_owneds/edit" do
  before(:each) do
    @customers_books_owned = assign(:customers_books_owned, stub_model(CustomersBooksOwned,
      :customer_id => 1,
      :book_id => 1
    ))
  end

  it "renders the edit customers_books_owned form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customers_books_owned_path(@customers_books_owned), "post" do
      assert_select "input#customers_books_owned_customer_id[name=?]", "customers_books_owned[customer_id]"
      assert_select "input#customers_books_owned_book_id[name=?]", "customers_books_owned[book_id]"
    end
  end
end
