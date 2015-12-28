class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /galleries/new
  def new
    @gallery = Gallery.new
    @user = current_user
  end

  # GET /galleries/1/edit
  def edit
    @user = current_user
  end

  def show
    @user = User.find(@gallery.user_id)
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.user_id = current_user.id

    respond_to do |format|
      if @gallery.save
        if params[:images]
          params[:images].each { |image|
            @gallery.gallery_images.create(photo: image)
          }
        end

        format.html { redirect_to user_path(:id => current_user.id), notice: 'Gallery was successfully created.' }
        format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new }
        format.json { render json: user_path(:id => current_user.id), status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galleries/1
  # PATCH/PUT /galleries/1.json
  def update
    respond_to do |format|
      if @gallery.update(gallery_params)
        if params[:images]
          params[:images].each { |image|
            @gallery.gallery_images.create(photo: image)
          }
        end

        format.html { redirect_to user_path(:id => current_user.id), notice: 'Gallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallery }
      else
        format.html { render :edit }
        format.json { render json: user_path(:id => current_user.id), status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_gallery
    @gallery = Gallery.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def gallery_params
    params.require(:gallery).permit(:user_id, :title)
  end
end
