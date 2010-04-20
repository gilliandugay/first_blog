require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test "should have many articles" do
    author = Author.create(:first_name => "Juan", :last_name => "Tamad")
    assert_not_nil author.articles
  end

  test "should validate the presence of last_name" do
    author = Author.new(:first_name => "Bonifacio")
    assert_equal false, author.save
  end

  test "should validate the presence of first_name" do
    author = Author.new(:last_name => "Rizal")
    assert_equal false, author.save
  end

  test "should validate the presence of first_name and last_name" do
    author = Author.new
    assert_equal false, author.save
  end
end
