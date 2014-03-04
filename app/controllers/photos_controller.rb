class PhotosController < ApplicationController
  def create
    @photo = Photo.create(params[:photo])
  end
  private
    def photo_params
      params[:photo].permit(:name, :image, :caption)
    end
  
end
