require 'test_helper'

class AuthorsRoutingTest < ActionController::TestCase
  test "should route to authors index" do
    assert_routing( '/authors', { :controller => 'authors', :action => 'index' } )
  end

  test "should route to new author" do
    assert_routing( '/authors/new', { :controller => 'authors', :action => 'new' } )
  end

  test "should route to create author" do
    assert_routing( { :method => 'post', :path => '/authors' }, { :controller => 'authors', :action => 'create' } )
  end

  test "should route to show author" do
    assert_routing( '/authors/1', { :controller => 'authors', :action => 'show', :id => '1' } )
  end

  test "should route to edit author" do
    assert_routing( '/authors/1/edit', { :controller => 'authors', :action => 'edit', :id => '1' } )
  end

  test "should route to update author" do
    assert_routing( { :method => 'put', :path => '/authors/1' }, { :controller => 'authors', :action => 'update', :id => '1' } )
  end

  test "should route to destroy author" do
    assert_routing( { :method => 'delete', :path => '/authors/1' }, { :controller => 'authors', :action => 'destroy', :id => '1' } )
  end
end
