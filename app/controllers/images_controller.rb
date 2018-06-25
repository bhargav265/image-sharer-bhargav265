class ImagesController < ApplicationController
  def index
    @images = Image.all
    @images = @images.order(created_at: :desc)
  end

  def new; end

  def create
    @image = Image.new(params.require(:image).permit(:url))
    if @image.save
      flash[:notice] = 'Image Saved!'
      redirect_to @image
    else
      flash[:notice] = 'Invalid URL'
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end
end
