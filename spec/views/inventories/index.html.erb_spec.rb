require 'spec_helper'

describe "inventories/index" do
  before(:each) do
    assign(:inventories, [
      stub_model(Inventory,
        :book_id => 1,
        :condition => "Condition"
      ),
      stub_model(Inventory,
        :book_id => 1,
        :condition => "Condition"
      )
    ])
  end

  it "renders a list of inventories" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Condition".to_s, :count => 2
  end
end
