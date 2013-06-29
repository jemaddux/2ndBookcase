require 'spec_helper'

describe "customers/new" do
  before(:each) do
    assign(:customer, stub_model(Customer,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zipcode => "MyString",
      :account_status => "MyString",
      :rental_plan => "MyString"
    ).as_new_record)
  end

  it "renders new customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customers_path, "post" do
      assert_select "input#customer_first_name[name=?]", "customer[first_name]"
      assert_select "input#customer_last_name[name=?]", "customer[last_name]"
      assert_select "input#customer_email[name=?]", "customer[email]"
      assert_select "input#customer_street_address[name=?]", "customer[street_address]"
      assert_select "input#customer_city[name=?]", "customer[city]"
      assert_select "input#customer_state[name=?]", "customer[state]"
      assert_select "input#customer_zipcode[name=?]", "customer[zipcode]"
      assert_select "input#customer_account_status[name=?]", "customer[account_status]"
      assert_select "input#customer_rental_plan[name=?]", "customer[rental_plan]"
    end
  end
end
