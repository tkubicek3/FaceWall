class PostsLikesController < ApplicationController
  before_action :set_posts_like, only: [:show, :edit, :update, :destroy]

  # GET /posts_likes
  # GET /posts_likes.json
  def index
    @posts_likes = PostsLike.all
  end

  # GET /posts_likes/1
  # GET /posts_likes/1.json
  def show
  end

  # GET /posts_likes/new
  def new
    @posts_like = PostsLike.new
  end

  # GET /posts_likes/1/edit
  def edit
  end

  # POST /posts_likes
  # POST /posts_likes.json
  def create
    @posts_like = PostsLike.new(posts_like_params)
    @posts_like.user_id = current_user.id

    respond_to do |format|
      if @posts_like.save
        format.html { redirect_to @posts_like, notice: 'Posts like was successfully created.' }
        format.json { render :show, status: :created, location: @posts_like }
      else
        format.html { render :new }
        format.json { render json: @posts_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts_likes/1
  # PATCH/PUT /posts_likes/1.json
  def update
    respond_to do |format|
      if @posts_like.update(posts_like_params)
        format.html { redirect_to @posts_like, notice: 'Posts like was successfully updated.' }
        format.json { render :show, status: :ok, location: @posts_like }
      else
        format.html { render :edit }
        format.json { render json: @posts_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts_likes/1
  # DELETE /posts_likes/1.json
  def destroy
    @posts_like.destroy
    respond_to do |format|
      format.html { redirect_to posts_likes_url, notice: 'Posts like was successfully destroyed.' }
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
