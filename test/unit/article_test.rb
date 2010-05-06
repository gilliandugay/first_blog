require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @article = Article.create(:title => "The Decline of Civilization", :body => "I cannot write.", :status => "Draft", :author_id => 1)
  end

  test "should have many comments" do
    assert_not_nil @article.comments
  end

  test "should belong to author" do
    assert(@article.respond_to? :author)
  end

  test "should validate the presence of title" do
    @article.title = nil
    assert_equal false, @article.save
  end

  test "should validate the presence of body" do
    @article.body = nil
    assert_equal false, @article.save
  end

  test "should validate the presence of title and body" do
    @article.title = nil
    @article.body = nil
    assert_equal false, @article.save
  end

  test "should validate inclusion in statuses" do
    @article.status = nil
    assert_equal false, @article.save
  end
end
