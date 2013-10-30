require 'spec_helper'

describe "series/edit" do
  before(:each) do
    @series = assign(:series, stub_model(Series,
      :title => "MyString",
      :description => "MyText",
      :author_id => 1
    ))
  end

  it "renders the edit series form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", series_path(@series), "post" do
      assert_select "input#series_title[name=?]", "series[title]"
      assert_select "textarea#series_description[name=?]", "series[description]"
      assert_select "input#series_author_id[name=?]", "series[author_id]"
    end
  end
end
