require 'spec_helper'

describe "series/new" do
  before(:each) do
    assign(:series, stub_model(Series,
      :title => "MyString",
      :description => "MyText",
      :author_id => 1
    ).as_new_record)
  end

  it "renders new series form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", series_index_path, "post" do
      assert_select "input#series_title[name=?]", "series[title]"
      assert_select "textarea#series_description[name=?]", "series[description]"
      assert_select "input#series_author_id[name=?]", "series[author_id]"
    end
  end
end
