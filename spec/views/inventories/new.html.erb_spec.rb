require 'spec_helper'

describe "inventories/new" do
  before(:each) do
    assign(:inventory, stub_model(Inventory,
      :book_id => 1,
      :condition => "MyString"
    ).as_new_record)
  end

  it "renders new inventory form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", inventories_path, "post" do
      assert_select "input#inventory_book_id[name=?]", "inventory[book_id]"
      assert_select "input#inventory_condition[name=?]", "inventory[condition]"
    end
  end
end
