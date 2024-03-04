class FavouritesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    check = Favourite.find_by(user: current_user, listing: Listing.find(params[:listing_id]))

    if check == nil
      fav = Favourite.new
      fav.listing = Listing.find(params[:listing_id])
      fav.user = current_user
      fav.save!
    else
      check.destroy
    end
  end
end
