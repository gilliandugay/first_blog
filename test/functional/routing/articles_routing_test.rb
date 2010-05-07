require 'test_helper'

class ArticlesRoutingTest < ActionController::TestCase
  test "should route to articles index" do
    assert_routing( '/articles', { :controller => 'articles', :action => 'index' } )
  end

  test "should route to new article" do
    assert_routing( '/articles/new', { :controller => 'articles', :action => 'new' } )
  end

  test "should route to create article" do
    assert_routing( { :method => 'post', :path => '/articles' }, { :controller => 'articles', :action => 'create' } )
  end

  test "should route to show article" do
    assert_routing( '/articles/1', { :controller => 'articles', :action => 'show', :id => '1' } )
  end

  test "should route to edit article" do
    assert_routing( '/articles/1/edit', { :controller => 'articles', :action => 'edit', :id => '1' } )
  end

  test "should route to update article" do
    assert_routing( { :method => 'put', :path => '/articles/1' }, { :controller => 'articles', :action => 'update', :id => '1' } )
  end

  test "should route to destroy article" do
    assert_routing( { :method => 'delete', :path => '/articles/1' }, { :controller => 'articles', :action => 'destroy', :id => '1' } )
  end

  test "should route to latest article" do
    assert_routing( '/articles/latest', { :controller => 'articles', :action => 'latest' } )
  end

  test "should route to print article" do
    assert_routing( '/articles/print', { :controller => 'articles', :action => 'print' } )
  end
end
