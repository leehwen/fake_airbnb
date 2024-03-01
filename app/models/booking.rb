class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :payment, presence: true
  validates :no_of_guests, presence: true

end
