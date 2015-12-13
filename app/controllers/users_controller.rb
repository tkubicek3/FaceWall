# UsersController
class UsersController < ApplicationController
  def index
    # Lepsi reseni?
    if current_user.has_role? :admin
      @users = User.all
    else
      redirect_to posts_url
    end
  end
end
