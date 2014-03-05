class PhotosController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @photo = @place.photos.build
  end

  def create
    @place = Place.find(params[:place_id])
    @photo = @place.photos.create(photo_params)
  end

  #def show
    #@photo = Photo.find(params[:id])
  #end

  private
    def photo_params
      params[:photo].permit(:name, :image, :caption)
    end
  
end
