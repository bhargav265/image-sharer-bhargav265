class ImagesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_index

  def index
    @images = if params[:tag]
                Image.tagged_with(params[:tag])
              else
                Image.all
              end
    @images = @images.order(created_at: :desc)
  end

  def new
    @image = Image.new
  end

  def edit
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(create_image_params.permit(:url))
    @image.tag_list.add(create_image_params.permit(:tag_list)[:tag_list], parse: true)
    if @image.save
      flash[:notice] = 'Image Saved!'
      redirect_to @image
    else
      render :new
    end
  end

  def update
    @image = Image.find(params[:id])

    if @image.update(create_image_params.permit(:url, :tag_list))
      redirect_to @image
    else
      render 'edit'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy!
    redirect_to images_path
  end

  private

  def create_image_params
    params.require(:image)
  end

  def redirect_to_index
    flash[:error] = 'Image not found'
    redirect_to images_path
  end
end
