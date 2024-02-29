class User < ApplicationRecord
  has_many :listings
  has_many :bookings
  has_many :bookings_as_host, through: :listings, source: :bookings
  has_one_attached :profile_picture
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def to_label
    first_name
  end
end
