# FriendshipsController
class FriendshipsController < ApplicationController
  def create
    if User.add_friendship(current_user, User.find(params[:user_id]))
      redirect_to request.referer, notice: 'Successfully invited friend!'
    else
      redirect_to request.referer, notice: "Sorry! You can't invite that user!"
    end
  end

  def update
    if User.update_friendship(current_user, User.find(params[:id]), params[:way])
      redirect_to request.referer, notice: 'Successfully updated friend!'
    else
      redirect_to request.referer, notice: 'Sorry! Could not update friend!'
    end
  end

  def destroy
    if User.remove_friendship(current_user, User.find(params[:id]))
      redirect_to request.referer, notice: 'Successfully removed friend!'
    else
      redirect_to request.referer, notice: "Sorry, couldn't remove friend!"
    end
  end
end
