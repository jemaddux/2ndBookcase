require 'spec_helper'

describe "customers_books_owneds/index" do
  before(:each) do
    assign(:customers_books_owneds, [
      stub_model(CustomersBooksOwned,
        :customer_id => 1,
        :book_id => 2
      ),
      stub_model(CustomersBooksOwned,
        :customer_id => 1,
        :book_id => 2
      )
    ])
  end
end
