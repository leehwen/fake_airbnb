class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :images

  CATEGORY = ["Condo", "HDB", "Bungalow", "Hotel"].sort
end
