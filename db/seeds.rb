# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Clearing database"

Booking.destroy_all
Listing.destroy_all
User.destroy_all

puts "start creating data"

host0 = User.create(
  first_name: "host0",
  last_name: "airbnb",
  email: "host0@email.com",
  password: "password"
)

guest0 = User.create(
  first_name: "guest0",
  last_name: "travelling",
  email: "guest0@email.com",
  password: "password"
)

listing = Listing.create(
  user: host0,
  no_of_rooms: 1,
  location: "raffles place",
  price_per_night: 200,
  category: "condo",
  description: "CBD city view"
)

Listing.create(
  user: host0,
  no_of_rooms: 3,
  location: "raffles place",
  price_per_night: 800,
  category: "condo",
  description: "Marina bay view"
)

Booking.create(
  start_date: Date.today + 10.days,
  end_date: Date.today + 15.days,
  listing:,
  user: guest0
)

puts "completed"
