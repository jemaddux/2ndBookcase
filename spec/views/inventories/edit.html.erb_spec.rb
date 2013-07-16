require 'spec_helper'

describe "inventories/edit" do
  before(:each) do
    @inventory = assign(:inventory, stub_model(Inventory,
      :book_id => 1,
      :condition => "MyString"
    ))
  end

  it "renders the edit inventory form" do
    render

    assert_select "form[action=?][method=?]", inventory_path(@inventory), "post" do
      assert_select "input#inventory_book_id[name=?]", "inventory[book_id]"
      assert_select "input#inventory_condition[name=?]", "inventory[condition]"
    end
  end
end
