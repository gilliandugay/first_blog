require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should have many comments" do
    article = Article.create(:title => "The Decline of Civilization", :body => "I cannot write.", :status => "Draft", :author_id => 1)
    assert_not_nil article.comments
  end

  test "should belong to author" do
    article = Article.create(:title => "The Decline of Civilization", :body => "I cannot write.", :status => "Draft", :author_id => 1)
    assert(article.respond_to? :author)
  end

  test "should validate the presence of title" do
    article = Article.new(:body => "This is my body.")
    assert_equal false, article.save
  end

  test "should validate the presence of body" do
    article = Article.new(:title => "Whispering Ghosts")
    assert_equal false, article.save
  end

  test "should validate the presence of title and body" do
    article = Article.new
    assert_equal false, article.save
  end

  test "should validate inclusion in statuses" do
    article = Article.new(:title => "The Decline of Civilization", :body => "I cannot write.", :status => "Unknown")
    assert_equal false, article.save
  end
end
