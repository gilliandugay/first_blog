require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
=begin
  def setup
    @author = Author.create(:first_name => "Juan",
                            :last_name => "Tamad",
                            :email => "juantamad@jt.com",
                            :login => "jtamad")
    @article = Article.create(:title => "The Decline of Civilization",
                              :body => "I cannot write.",
                              :status => "Draft")
    @author.articles << @article

    Article.create(:title => "Post Post Post",
                    :body => "This is a post.",
                    :status => "Posted")
    @author.articles << Article.last
  end

  test "should have many comments" do
    assert_not_nil @article.comments
  end

  test "should belong to author" do
    assert(@article.respond_to? :author)
  end

  test "should validate the presence of title" do
    @article.title = nil
    @article.save
    assert_not_nil @article.errors.on(:title)
  end

  test "should validate the presence of body" do
    @article.body = nil
    @article.save
    assert_not_nil @article.errors.on(:body)
  end

  test "should validate inclusion in statuses" do
    @article.status = 'Unknown'
    @article.save
    assert_not_nil @article.errors.on(:status)
  end

  test "should set date posted before save" do
    @article.status = 'Posted'
    @article.save
    assert_not_nil @article.date_posted
  end

  test "should get recent posts through named scope" do
    Article.all.each do |article|
      puts article.inspect
    end
    puts "----------------------"
    assert_equal 1, Article.recent(1).count
  end

  test "should get all posts through named scope" do
    assert_equal 1, Article.posts.count
  end

  test "should get all drafts through named scope" do
    assert_equal 1, Article.drafts.count
  end

  test "should get all articles by author through named scope" do
    assert_equal 2, Article.by_author(@author.id).count
  end
=end
end
