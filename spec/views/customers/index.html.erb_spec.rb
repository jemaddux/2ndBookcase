require 'spec_helper'

describe "customers/index" do
  before(:each) do
    assign(:customers, [
      stub_model(Customer,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zipcode => "Zipcode",
        :account_status => "Account Status",
        :rental_plan => "Rental Plan"
      ),
      stub_model(Customer,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zipcode => "Zipcode",
        :account_status => "Account Status",
        :rental_plan => "Rental Plan"
      )
    ])
  end

  it "renders a list of customers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => "Account Status".to_s, :count => 2
    assert_select "tr>td", :text => "Rental Plan".to_s, :count => 2
  end
end
