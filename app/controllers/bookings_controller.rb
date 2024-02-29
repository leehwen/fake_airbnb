class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new(booking_params)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.save!

    redirect_to bookings_path
  end

  def passdata
    # @booking = Booking.new
    # @listing = Listing.first
    # @listing = Listing.find(params[:listing_id]) # TO DO: need to fetch it from listing show page
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :no_of_guests, :payment, :listing_id)
  end
end
