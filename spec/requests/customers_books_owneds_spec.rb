require 'spec_helper'

describe "CustomersBooksOwneds" do
  describe "GET /customers_books_owneds" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get customers_books_owneds_path
      response.status.should be(200)
    end
  end
end
