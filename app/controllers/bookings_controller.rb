class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.payment = "Visa"
    if !@booking.valid?
      @listing = Listing.find(booking_params[:listing_id])
      @user = User.find(@listing.user_id)
      @markers = [{ lat: @listing.latitude,
                 lng: @listing.longitude,
                 info_window_html: render_to_string(partial: "listings/info_window", locals: {listing: @listing})}]

      render "listings/show", status: :unprocessable_entity
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else

      render "new", status: :unprocessable_entity
    end
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

  def approve
    @booking = Booking.find(params[:id])
    @booking.update!(host_approved: true)
    redirect_to dashboard_path
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.update!(host_approved: false)
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :no_of_guests, :payment, :listing_id)
  end
end
