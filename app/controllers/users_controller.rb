class UsersController < ApplicationController
  def dashboard
    @bookings = current_user.bookings_as_host
  end
end
