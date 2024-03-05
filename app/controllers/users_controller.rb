class UsersController < ApplicationController
  def dashboard
    @confirmed_bookings = current_user.bookings_as_host.where(host_approved: true)
    @rejected_bookings = current_user.bookings_as_host.where(host_approved: false)
    @pending_bookings = current_user.bookings_as_host.where(host_approved: nil)
    @listings = current_user.listings
  end

  def favourites
    fav = current_user.favourites
    fav_listing = fav.map do |fav| fav.listing_id end

    @listings = Listing.where(id: fav_listing)
  end
end
