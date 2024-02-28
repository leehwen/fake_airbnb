class BookingsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @bookings = @user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end
end
