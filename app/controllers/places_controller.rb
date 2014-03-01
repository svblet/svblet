class PlacesController < ApplicationController

  before_filter :signed_in_user, only: [:new, :create]

  def new
    @place = Place.new
  end

  def create
    @user = current_user
    @place = @user.places.new(place_params) # TODO: permit other required fields for a place

    if @place.save
      redirect_to place_path(@place)
    else
      render 'new'
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def index
    if params[:user_id]
      @user = User.find_by_slug(params[:user_id])
      @places = @user.places
    else
      @places = Place.all
    end
  end

  private
    def place_params
      params.require(:place).permit(:title, :description, :price, :location)
    end

end
