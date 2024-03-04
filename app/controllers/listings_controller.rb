class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :results]

  def index
    @listings = Listing.all
    @listings = @listings.where("category ILIKE ?", "%#{params[:category]}%") if params[:category].present?
    @listings = @listings.where("no_of_rooms = ?", params[:no_of_rooms]) if params[:no_of_rooms].present?
    @listings = @listings.where("price_per_night <= ?", params[:maxprice]) if params[:maxprice].present?
    @listings = @listings.where("price_per_night >= ?", params[:minprice]) if params[:minprice].present?
  end

  def results
    @listings = Listing.near(params[:query], 5)
    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {listing: listing})
      }
    end
  end

  def locationresults
    sw_corner = [40.71, 100.23] # to pass in the coords from JS map controller
    ne_corner = [36.12, 88.65]  # to pass in the coords from JS map controller
    @listings = Listing.within_bounding_box(sw_corner, ne_corner)
    @markers = @listings.geocoded.map do |listing|
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

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(params_listing)
    redirect_to listing_path(@listing)
  end

  def destroy
    @listing = Listing.find(params[:id])
    if @listing.bookings.present?
      redirect_to dashboard_path, :alert => "This listing can't be deleted as it has pending bookings for approval."
    else
      @listing.destroy
      redirect_to dashboard_path
    end
  end

  private

  def params_listing
    params.require(:listing).permit(:title, :subtitle, :category, :no_of_rooms, :location,
      :price_per_night, :no_of_guests, :description, :user_id, images: [])
  end
end
