require 'spec_helper'

describe 'article_comments/edit' do
  before(:each) do
    @article_comment = assign(:article_comment, stub_model(ArticleComment,
      :article_id => 1,
      :customer_id => 1,
      :active => false
    ))
  end

  it 'renders the edit article_comment form' do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'form[action=?][method=?]', article_comment_path(@article_comment), 'post' do
      assert_select 'input#article_comment_article_id[name=?]', 'article_comment[article_id]'
      assert_select 'input#article_comment_customer_id[name=?]', 'article_comment[customer_id]'
      assert_select 'input#article_comment_active[name=?]', 'article_comment[active]'
    end
  end
end
