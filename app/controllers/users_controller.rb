class UsersController < ApplicationController
  def dashboard
    @bookings = current_user.bookings_as_host
    @listings = current_user.listings
  end
end
