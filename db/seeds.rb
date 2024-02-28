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

host1 = User.create(
  first_name: "host1",
  last_name: "airbnb",
  email: "host1@email.com",
  password: "password"
)

guest0 = User.create(
  first_name: "guest0",
  last_name: "travelling",
  email: "guest0@email.com",
  password: "password"
)

guest1 = User.create(
  first_name: "guest1",
  last_name: "travelling",
  email: "guest1@email.com",
  password: "password"
)

listing = Listing.create(
  user: host0,
  title: "Lorem nulla deserunt adipisicing anim duis minim cillum esse incididunt mollit ad aliqua cillum.",
  subtitle: "nisi ut cillum culpa",
  no_of_rooms: 1,
  location: "raffles place",
  price_per_night: 200,
  category: "condo",
  description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
  no_of_guests: 1
)

listing1 = Listing.create(
  user: host0,
  title: "Amet mollit excepteur non qui est et minim.",
  subtitle: "dolore ea ut aliquip",
  no_of_rooms: 3,
  location: "raffles place",
  price_per_night: 800,
  category: "condo",
  description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
  no_of_guests: 3
)

listing2 = Listing.create(
  user: host0,
  title: "Lorem officia dolor nisi tempor irure est.",
  subtitle: "nulla mollit labore velit",
  no_of_rooms: 2,
  location: "kovan",
  price_per_night: 200,
  category: "HDB",
  description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
  no_of_guests: 2
)

listing3 = Listing.create(
  user: host1,
  title: "Dolore anim velit incididunt voluptate laborum consequat.",
  subtitle: "dolore eiusmod qui in",
  no_of_rooms: 4,
  location: "woodlands",
  price_per_night: 500,
  category: "landed",
  description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
  no_of_guests: 4
)

listing4 = Listing.create(
  user: host1,
  title: "Nulla cillum ad magna ipsum.",
  subtitle: "qui amet pariatur commodo",
  no_of_rooms: 7,
  location: "changi",
  price_per_night: 100,
  category: "landed",
  description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
  no_of_guests: 7
)

listing5 = Listing.create(
  user: host1,
  title: "Non enim sint fugiat nisi deserunt Lorem nulla irure irure labore veniam ut.",
  subtitle: "do occaecat in non",
  no_of_rooms: 3,
  location: "sentosa",
  price_per_night: 800,
  category: "condo",
  description: "Posh location at Sentosa cove.",
  no_of_guests: 3
)

listing6 = Listing.create(
  user: host1,
  title: "Non enim sint fugiat nisi deserunt Lorem nulla irure irure labore veniam ut.",
  subtitle: "quis mollit sint enim",
  no_of_rooms: 2,
  location: "orchard",
  price_per_night: 650,
  category: "condo",
  description: "Nice condo near Orchard road shopping belt",
  no_of_guests: 2
)

Booking.create(
  start_date: Date.today + 10.days,
  end_date: Date.today + 15.days,
  listing: listing1,
  user: guest0,
  no_of_guests: 2,
  host_approved: true
)

Booking.create(
  start_date: Date.today + 3.days,
  end_date: Date.today + 7.days,
  listing: listing2,
  user: guest0,
  no_of_guests: 1
)

Booking.create(
  start_date: Date.today + 1.days,
  end_date: Date.today + 2.days,
  listing: listing3,
  user: guest0,
  no_of_guests: 3,
  host_approved: false
)

Booking.create(
  start_date: Date.today + 3.days,
  end_date: Date.today + 7.days,
  listing: listing1,
  user: guest1,
  no_of_guests: 1
)

Booking.create(
  start_date: Date.today + 1.days,
  end_date: Date.today + 2.days,
  listing: listing2,
  user: guest1,
  no_of_guests: 2,
  host_approved: true
)

Booking.create(
  start_date: Date.today + 7.days,
  end_date: Date.today + 14.days,
  listing: listing3,
  user: guest1,
  no_of_guests: 4
)

puts "completed"
