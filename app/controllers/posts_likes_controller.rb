# PostsLikesController
class PostsLikesController < ApplicationController
  before_action :set_posts_like, only: [:show, :edit, :update, :destroy]

  # GET /posts_likes/new
  def new
    @posts_like = PostsLike.new
  end

  def index
    @p = Post.find(params[:id])
    @user = @p.user
  end

  # POST /posts_likes
  # POST /posts_likes.json
  def create
    @posts_like = PostsLike.new(posts_like_params)
    @posts_like.user_id = current_user.id

    respond_to do |format|
      if @posts_like.save
        format.html { redirect_to root_path, notice: 'You like it.' }
      else
        format.html { redirect_to root_path, status: 'Error.' }
      end
    end
  end

  # DELETE /posts_likes/1
  # DELETE /posts_likes/1.json
  def destroy
    @posts_like.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_posts_like
    @posts_like = PostsLike.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def posts_like_params
    params.require(:posts_like).permit(:post_id, :user_id)
  end
end
