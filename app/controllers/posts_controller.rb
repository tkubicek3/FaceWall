# PostContoller
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /posts
  # GET /posts.json
  def index
    index_posts

    @comment = Comment.new
    @user = current_user
    @post = Post.new
    @posts_like = PostsLike.new
  end

  # GET /posts/1/edit
  def edit
    @user = current_user
  end

  # POST /posts
  # POST /posts.json
  def create
    vars_init

    image = params[:post][:image]
    @post.gallery_image_id = GalleryImage.create(photo: image).id if image

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
      else
        format.html { render :index }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @posts = Post.all.order(:updated_at)
    @user = current_user

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to root_path, notice: 'Post was successfully updated.' }
      else
        format.html { render :index }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet.
  def post_params
    params.require(:post).permit(:content, :user_id, :gallery_image_id)
  end

  def vars_init
    @posts = Post.all.order(:updated_at)
    @user = current_user
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @comment = Comment.new
  end

  def index_posts
    if params[:search]
      @posts = Post.search(params[:search]) + Post.search_by_user(params[:search])
      @posts = @posts.sort.reverse { |a, b| a[:created_at] <=> b[:created_at] }
    elsif params[:search_by_image_id]
      @posts = Post.where(gallery_image_id: params[:search_by_image_id])
    else
      # FASTER
      @posts = Post.where('user_id IN (:ids) OR user_id = :my_id',
                          ids: current_user.friends.map(&:id),
                          my_id: current_user.id).order(created_at: :desc)

      # SLOWER
      # @post = current_user.posts
      #
      # current_user.friends.each do |friend|
      #   @post += friend.posts
      # end
    end
  end
end
