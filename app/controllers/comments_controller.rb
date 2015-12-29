# CommentsController
class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # POST /comments
  # POST /comments.json
  def create
    @posts = Post.all.order(:updated_at)
    @user = current_user

    comment = Post.find(params[:post_id]).comments.new(comment_params)
    comment.user_id = current_user.id

    comment.gallery_image_id = GalleryImage.create(photo: params[:comment][:image]).id if params[:comment][:image]

    msg = comment.save ? 'Comment saved' : 'Unable to save comment: ' + comment.errors.full_messages.join('. ')
    redirect_to root_path, notice: msg
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Comment was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content, :user_id, :gallery_image_id, :post_id)
  end
end
