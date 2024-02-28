class ListingsController < ApplicationController
  def index
  
  end

  def show
    @listing = Listing.find(params[:id])
    @user=User.find(@listing.user_id)
  end
end
