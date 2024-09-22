class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :update, :destroy]

  def index
    @images = Image.all.limit(10)
    render json: @images
  end

  def show
    render json: @image
  end

  def create
    @image = Image.create(image_params)
    if @image.save
      render json: @image
    else
      render json: { errors: @image.errors.full_messages }, status: 422
    end
  end

  def update
    if @image.update(image_params)
      render json: @image
    else
      render json: { errors: @image.errors.full_messages }, status: 422
    end
  end

  def destroy
    @image.destroy
    render json: { message: "Image deleted" }
  end

  private

  def image_params
    params.require(:image).permit(:remote_image_url, :recipe_id)
  end

  def set_image
    @image = Image.find(params[:id])
  end
end
