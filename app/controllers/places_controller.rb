class PlacesController < ApplicationController

  before_filter :signed_in_user, only: [:new, :create, :edit]

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

  def edit
    @place = Place.find(params[:id])
  end

  def show
    @place = Place.find(params[:id])
  end

  def index
    if params[:user_id]
      @user = User.find_by_slug(params[:user_id])
      @places = @user.places
      @show_edit_button = false

      if signed_in? && is_current_user?(@user)
        @show_edit_button = true
      end
    else
      @places = Place.all
    end
  end

  private
    def place_params
      params.require(:place).permit(:title, :description, :price, :location)
    end

end
