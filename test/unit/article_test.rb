require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    authors(:full).articles << articles(:one)
    authors(:full).articles << articles(:two)
    authors(:full).save
  end

  test "should have many comments" do
    assert_not_nil articles(:one).comments
  end

  test "should belong to author" do
    assert(articles(:one).respond_to? :author)
  end

  test "should validate the presence of title" do
    articles(:one).title = nil
    articles(:one).save
    assert_not_nil articles(:one).errors.on(:title)
  end

  test "should validate the presence of body" do
    articles(:one).body = nil
    articles(:one).save
    assert_not_nil articles(:one).errors.on(:body)
  end

  test "should validate inclusion in statuses" do
    articles(:one).status = 'Unknown'
    articles(:one).save
    assert_not_nil articles(:one).errors.on(:status)
  end

  test "should set date posted before save" do
    articles(:one).status = 'Posted'
    articles(:one).save
    assert_not_nil articles(:one).date_posted
  end

  test "should get recent posts through named scope" do
    assert_equal 1, Article.recent(1).count
  end

  test "should get all posts through named scope" do
    assert_equal 1, Article.posts.count
  end

  test "should get all drafts through named scope" do
    assert_equal 1, Article.drafts.count
  end

  test "should get all articles by author through named scope" do
    assert_equal 2, Article.by_author(authors(:full)).count
  end

  test "should get all articles by author id through named scope" do
    assert_equal 2, Article.by_author(authors(:full).id).count
  end
end
