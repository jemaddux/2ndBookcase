require 'spec_helper'

describe "customers_books_reads/index" do
  before(:each) do
    assign(:customers_books_reads, [
      stub_model(CustomersBooksRead,
        :customer_id => 1,
        :book_id => 2
      ),
      stub_model(CustomersBooksRead,
        :customer_id => 1,
        :book_id => 2
      )
    ])
  end

  it "renders a list of customers_books_reads" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
