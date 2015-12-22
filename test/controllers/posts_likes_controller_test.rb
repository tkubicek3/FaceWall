require 'test_helper'

class PostsLikesControllerTest < ActionController::TestCase
  setup do
    @posts_like = posts_likes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts_likes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create posts_like" do
    assert_difference('PostsLike.count') do
      post :create, posts_like: { post_id: @posts_like.post_id, user_id: @posts_like.user_id }
    end

    assert_redirected_to posts_like_path(assigns(:posts_like))
  end

  test "should show posts_like" do
    get :show, id: @posts_like
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @posts_like
    assert_response :success
  end

  test "should update posts_like" do
    patch :update, id: @posts_like, posts_like: { post_id: @posts_like.post_id, user_id: @posts_like.user_id }
    assert_redirected_to posts_like_path(assigns(:posts_like))
  end

  test "should destroy posts_like" do
    assert_difference('PostsLike.count', -1) do
      delete :destroy, id: @posts_like
    end

    assert_redirected_to posts_likes_path
  end
end
