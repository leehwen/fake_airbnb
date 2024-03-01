class UsersController < ApplicationController
  def dashboard
    @confirmed_bookings = current_user.bookings_as_host.where(host_approved: true)
    @rejected_bookings = current_user.bookings_as_host.where(host_approved: false)
    @pending_bookings = current_user.bookings_as_host.where(host_approved: nil)
    @listings = current_user.listings
  end
end
