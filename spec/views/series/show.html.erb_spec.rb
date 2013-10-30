require 'spec_helper'

describe "series/show" do
  before(:each) do
    @series = assign(:series, stub_model(Series,
      :title => "Title",
      :description => "MyText",
      :author_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
