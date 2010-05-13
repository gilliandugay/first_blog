require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  def setup
    @rating = Rating.create(:liked => true)
    #author(:full).ratings << @rating
    #article(:one).ratings << @rating
  end

  test "should belong to author" do
    assert(@rating.respond_to? :author)
  end

  test "should belong to article" do
    assert(@rating.respond_to? :article)
  end

  test "should validate the presence of author" do
    author(:full).ratings.clear
    assert_equal false, @rating.save
  end

  test "should validate the presence of article" do
    article(:one).ratings.clear
    assert_equal false, @rating.save
  end
end
