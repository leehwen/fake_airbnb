class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :images
  has_many :favourites, dependent: :destroy
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  
  CATEGORY = ["Condo", "HDB", "Bungalow", "Hotel"].sort
  
  validates :category, :no_of_rooms, :location, :price_per_night, :no_of_guests, :description, :title, :subtitle, presence: true
  validates :no_of_guests, :no_of_rooms, :price_per_night, numericality: { greater_than: 0 }
  # validates :images, limit: { min: 5, max: 5, message: "selected must be 5"}

  def cleaning_fee
    50
  end

  def service_fee
    10
  end
  
  def tax_and_others
    5
  end

  def total_fees
    cleaning_fee + service_fee + tax_and_others
  end

  def total_fees_notax
    cleaning_fee + service_fee
  end
end
