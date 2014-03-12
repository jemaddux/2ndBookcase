require 'spec_helper'

describe "article_comments/show" do
  before(:each) do
    @article_comment = assign(:article_comment, stub_model(ArticleComment,
      :article_id => 1,
      :customer_id => 2,
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
  end
end
