require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test "should have many articles" do
    assert_not_nil authors(:full).articles
  end

  test "should validate the presence of last_name" do
    authors(:full).last_name = nil
    authors(:full).save
    assert_not_nil authors(:full).errors.on(:last_name)
  end

  test "should validate the presence of first_name" do
    authors(:full).first_name = nil
    authors(:full).save
    assert_not_nil authors(:full).errors.on(:first_name)
  end

  test "should validate the presence of email" do
    authors(:full).email = nil
    authors(:full).save
    assert_not_nil authors(:full).errors.on(:email)
  end

  test "should validate the presence of login" do
    authors(:full).login = nil
    authors(:full).save
    assert_not_nil authors(:full).errors.on(:login)
  end

  test "should validate the uniqueness of login" do
    copy = Author.create(:last_name  => "MyString",
                         :first_name => "MyString",
                         :remarks    => "MyText",
                         :birthday   => DateTime.now,
                         :email      => "mystring@mystring.com",
                         :login      => "MyString");
    assert_not_nil copy.errors.on(:login)
  end
end
