# UsersController
class UsersController < ApplicationController
  def index
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.order("created_at DESC")
    end
  end

  def show
      @user = User.find(params[:id])
  end
end
