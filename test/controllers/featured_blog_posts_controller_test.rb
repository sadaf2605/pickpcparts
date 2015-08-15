require 'test_helper'

class FeaturedBlogPostsControllerTest < ActionController::TestCase
  setup do
    @featured_blog_post = featured_blog_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:featured_blog_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create featured_blog_post" do
    assert_difference('FeaturedBlogPost.count') do
      post :create, featured_blog_post: {  }
    end

    assert_redirected_to featured_blog_post_path(assigns(:featured_blog_post))
  end

  test "should show featured_blog_post" do
    get :show, id: @featured_blog_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @featured_blog_post
    assert_response :success
  end

  test "should update featured_blog_post" do
    patch :update, id: @featured_blog_post, featured_blog_post: {  }
    assert_redirected_to featured_blog_post_path(assigns(:featured_blog_post))
  end

  test "should destroy featured_blog_post" do
    assert_difference('FeaturedBlogPost.count', -1) do
      delete :destroy, id: @featured_blog_post
    end

    assert_redirected_to featured_blog_posts_path
  end
end
