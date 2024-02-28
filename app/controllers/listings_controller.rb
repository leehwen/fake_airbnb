class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(params_listing)
    @listing.save
  end

  def show
    @listing = Listing.find(params[:id])
    @user = User.find(@listing.user_id)
  end

  private

  def params_listing
    params.require(:listing).permit(:category, :no_of_rooms, :location, :price_per_night, :no_of_guests, :description, :user_id, images: [])
  end
end
