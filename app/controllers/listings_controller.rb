class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @listings = Listing.all
  end

  def results
    @listings = Listing.near(params[:query], 10)
    @markers = @listings.geocoded.map do | listing |
      {
        lat: listing.latitude,
        lng: listing.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {listing: listing})
      }
    end
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(params_listing)
    @listing.user = current_user
    if @listing.save
      redirect_to listings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @user = User.find(@listing.user_id)
    @markers = [{ lat: @listing.latitude,
               lng: @listing.longitude,
               info_window_html: render_to_string(partial: "info_window", locals: {listing: @listing})}]
  end

  private

  def params_listing
    params.require(:listing).permit(:title, :subtitle, :category, :no_of_rooms, :location,
      :price_per_night, :no_of_guests, :description, :user_id, images: [])
  end
end
