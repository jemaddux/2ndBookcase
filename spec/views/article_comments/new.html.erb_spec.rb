require 'spec_helper'

describe 'article_comments/new' do
  before(:each) do
    assign(:article_comment, stub_model(ArticleComment,
      :article_id => 1,
      :customer_id => 1,
      :active => false
    ).as_new_record)
  end

  it 'renders new article_comment form' do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'form[action=?][method=?]', article_comments_path, 'post' do
      assert_select 'input#article_comment_article_id[name=?]', 'article_comment[article_id]'
      assert_select 'input#article_comment_customer_id[name=?]', 'article_comment[customer_id]'
      assert_select 'input#article_comment_active[name=?]', 'article_comment[active]'
    end
  end
end
