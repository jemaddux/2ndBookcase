require 'spec_helper'

describe "inventories/show" do
  before(:each) do
    @inventory = assign(:inventory, stub_model(Inventory,
      :book_id => 1,
      :condition => "Condition"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Condition/)
  end
end
