class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :images
  validates :images, limit: { min: 5, max: 5, message: "selected must be 5"}

  CATEGORY = ["Condo", "HDB", "Bungalow", "Hotel"].sort

end
