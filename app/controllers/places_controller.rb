class PlacesController < ApplicationController

  def new
    @user = User.find_by_slug(params[:user_id])
    @place = Place.new
  end

  def create
    @user = User.find_by_slug(params[:user_id])
    @place = @user.places.new(place_params) # TODO: permit other required fields for a place

    if @place.save
      redirect_to user_place_path(@user, @place)
    else 
      render 'new'
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def index
    @user = User.find_by_slug(params[:user_id])
    @places = @user.places
  end

  private
    def place_params
      params.require(:place).permit(:title, :description, :price, :location)
    end

end
