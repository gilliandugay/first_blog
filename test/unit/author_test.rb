require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  def setup
    @author = Author.create(:first_name => "Juan", :last_name => "Tamad")
  end

  test "should have many articles" do
    assert_not_nil @author.articles
  end

  test "should validate the presence of last_name" do
    @author.last_name = nil
    assert_equal false, @author.save
  end

  test "should validate the presence of first_name" do
    @author.first_name = nil
    assert_equal false, @author.save
  end

  test "should validate the presence of first_name and last_name" do
    @author = Author.new
    assert_equal false, @author.save
  end
end
