class GalleryImagesController < ApplicationController
  before_action :set_gallery_image, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /gallery_images/new
  def new
    @gallery_image = GalleryImage.new
  end

  # POST /gallery_images
  # POST /gallery_images.json
  def create
    @gallery_image = GalleryImage.new(gallery_image_params)

    respond_to do |format|
      if @gallery_image.save
        format.html { redirect_to @gallery_image, notice: 'Gallery image was successfully created.' }
        format.json { render :show, status: :created, location: @gallery_image }
      else
        format.html { render :new }
        format.json { render json: @gallery_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gallery_images/1
  # DELETE /gallery_images/1.json
  def destroy
    @gallery_image.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Gallery image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_gallery_image
    @gallery_image = GalleryImage.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def gallery_image_params
    params.require(:gallery_image).permit(:gallery_id, :description)
  end
end
