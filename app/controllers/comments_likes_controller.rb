class CommentsLikesController < ApplicationController
  before_action :set_comments_like, only: [:show, :edit, :update, :destroy]

  # GET /comments_likes
  # GET /comments_likes.json
  def index
    @comments_likes = CommentsLike.all
  end

  # GET /comments_likes/1
  # GET /comments_likes/1.json
  def show
  end

  # GET /comments_likes/new
  def new
    @comments_like = CommentsLike.new
  end

  # GET /comments_likes/1/edit
  def edit
  end

  # POST /comments_likes
  # POST /comments_likes.json
  def create
    @comments_like = CommentsLike.new(comments_like_params)

    respond_to do |format|
      if @comments_like.save
        format.html { redirect_to @comments_like, notice: 'Comments like was successfully created.' }
        format.json { render :show, status: :created, location: @comments_like }
      else
        format.html { render :new }
        format.json { render json: @comments_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments_likes/1
  # PATCH/PUT /comments_likes/1.json
  def update
    respond_to do |format|
      if @comments_like.update(comments_like_params)
        format.html { redirect_to @comments_like, notice: 'Comments like was successfully updated.' }
        format.json { render :show, status: :ok, location: @comments_like }
      else
        format.html { render :edit }
        format.json { render json: @comments_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments_likes/1
  # DELETE /comments_likes/1.json
  def destroy
    @comments_like.destroy
    respond_to do |format|
      format.html { redirect_to comments_likes_url, notice: 'Comments like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comments_like
      @comments_like = CommentsLike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comments_like_params
      params.require(:comments_like).permit(:comment_id, :user_id)
    end
end
