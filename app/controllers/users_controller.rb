# UsersController
class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @user = current_user

    if params[:search]
      @users = User.where.not(id: current_user.id).search(params[:search]).order(created_at: :desc)
    else
      @users = User.where.not(id: current_user.id).order(created_at: :desc)
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(updated_at: :desc)
    @comment = Comment.new
    @post = Post.new
  end

  def friends
    @user = User.find(params[:id])
  end
end
