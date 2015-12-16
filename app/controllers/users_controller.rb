# UsersController
class UsersController < ApplicationController
  def index
    if params[:search]
      @users = User.where.not(id: current_user.id).search(params[:search]).order("created_at DESC")
    else
      @users = User.where.not(id: current_user.id).order("created_at DESC")
    end
  end

  def show
      @user = User.find(params[:id])
  end
end
