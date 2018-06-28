class ImagesController < ApplicationController
  def index
    @images = Image.all
    @images = @images.order(created_at: :desc)
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(create_image_params.permit(:url))
    @image.tag_list.add(create_image_params.permit(:tag_list).require(:tag_list), parse: true)
    if @image.save
      flash[:notice] = 'Image Saved!'
      redirect_to @image
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def create_image_params
    params.require(:image)
  end
end
