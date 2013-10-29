require 'spec_helper'

describe "chapters/new" do
  before(:each) do
    assign(:chapter, stub_model(Chapter,
      :book_id => 1,
      :title => "MyString",
      :summary => "MyText",
      :position => 1
    ).as_new_record)
  end

  it "renders new chapter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", chapters_path, "post" do
      assert_select "input#chapter_book_id[name=?]", "chapter[book_id]"
      assert_select "input#chapter_title[name=?]", "chapter[title]"
      assert_select "textarea#chapter_summary[name=?]", "chapter[summary]"
      assert_select "input#chapter_position[name=?]", "chapter[position]"
    end
  end
end
