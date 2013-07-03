require 'spec_helper'

describe "categories/show" do
  before(:each) do
    @category = assign(:category, stub_model(Category,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do

  end
end
