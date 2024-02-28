class BookingsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @bookings = @user.bookings
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end
end
