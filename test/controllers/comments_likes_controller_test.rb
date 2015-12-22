require 'test_helper'

class CommentsLikesControllerTest < ActionController::TestCase
  setup do
    @comments_like = comments_likes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments_likes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comments_like" do
    assert_difference('CommentsLike.count') do
      post :create, comments_like: { comment_id: @comments_like.comment_id, user_id: @comments_like.user_id }
    end

    assert_redirected_to comments_like_path(assigns(:comments_like))
  end

  test "should show comments_like" do
    get :show, id: @comments_like
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comments_like
    assert_response :success
  end

  test "should update comments_like" do
    patch :update, id: @comments_like, comments_like: { comment_id: @comments_like.comment_id, user_id: @comments_like.user_id }
    assert_redirected_to comments_like_path(assigns(:comments_like))
  end

  test "should destroy comments_like" do
    assert_difference('CommentsLike.count', -1) do
      delete :destroy, id: @comments_like
    end

    assert_redirected_to comments_likes_path
  end
end
