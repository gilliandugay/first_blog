require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = Comment.create(:email => "123@yahoo.com", :body => "Hello.", :article_id => 1)
  end

  test "should belong to article" do
    assert(@comment.respond_to? :article)
  end

  test "should validate the presence of email" do
    @comment.email = nil
    assert_equal false, @comment.save
  end

  test "should validate the presence of body" do
    @comment.body = nil
    assert_equal false, @comment.save
  end

  test "should validate the presence of email and body" do
    @comment.email = nil
    @comment.body = nil
    assert_equal false, @comment.save
  end
end
