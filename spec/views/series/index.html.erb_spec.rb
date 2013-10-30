require 'spec_helper'

describe "series/index" do
  before(:each) do
    assign(:series, [
      stub_model(Series,
        :title => "Title",
        :description => "MyText",
        :author_id => 1
      ),
      stub_model(Series,
        :title => "Title",
        :description => "MyText",
        :author_id => 1
      )
    ])
  end

  it "renders a list of series" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
