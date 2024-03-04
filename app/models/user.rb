class User < ApplicationRecord
  has_many :listings
  has_many :bookings
  has_many :bookings_as_host, through: :listings, source: :bookings
  has_many :favourites, dependent: :destroy
  has_one_attached :profile_picture
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :email, :password, presence: true

  def to_label
    first_name
  end
end
