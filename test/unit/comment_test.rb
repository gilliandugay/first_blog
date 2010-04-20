require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should belong to article" do
    comment = Comment.create(:email => "123@yahoo.com", :body => "Hello.", :article_id => 1)
    assert(comment.respond_to? :article)
  end

  test "should validate the presence of email" do
    comment = Comment.new(:body => "This article sucks.")
    assert_equal false, comment.save
  end

  test "should validate the presence of body" do
    comment = Comment.new(:email => "ihatearticles@gmail.com")
    assert_equal false, comment.save
  end

  test "should validate the presence of email and body" do
    comment = Comment.new
    assert_equal false, comment.save
  end
end
