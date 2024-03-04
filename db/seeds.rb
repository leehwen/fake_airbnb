# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Clearing database..."

Booking.destroy_all
Listing.destroy_all
User.destroy_all

puts "Creating data...."

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
  title: "Boat Quay Studio",
  subtitle: "Room in aparthotel in Singapore",
  no_of_rooms: 1,
  location: "6 Eu Tong Sen Street, Singapore 059817",
  price_per_night: 200,
  category: "Condo",
  description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
  no_of_guests: 1
)

listing1 = Listing.create(
  user: host0,
  title: "Shipping Container 4 @ One-North",
  subtitle: "Entire home in Singapore",
  no_of_rooms: 3,
  location: "77 Ayer Rajah Crescent, Singapore 139954",
  price_per_night: 800,
  category: "Hotel",
  description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
  no_of_guests: 3
)

listing2 = Listing.create(
  user: host0,
  title: "Home on the subway, no more than 3 min walk to the subway mall",
  subtitle: "Room in Singapore",
  no_of_rooms: 2,
  location: "85 Bedok North Street 4, Singapore 460085",
  price_per_night: 200,
  category: "HDB",
  description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
  no_of_guests: 2
)

listing3 = Listing.create(
  user: host1,
  title: "Budget short stay",
  subtitle: "Private room in rental unit in Singapore",
  no_of_rooms: 4,
  location: "354 Woodlands Avenue 5, Singapore 730354",
  price_per_night: 100,
  category: "HDB",
  description: "Close to Hospital, Park, shopping & eateries. Room has wall fan, writing desk, just a simple room good for short budget stay.",
  no_of_guests: 4
)

listing4 = Listing.create(
  user: host1,
  title: "Spacious Room 1 @ Jurong West Near NTU",
  subtitle: "Room in Singapore",
  no_of_rooms: 7,
  location: "21 Lien Ying Chow Dr, Singapore 637296",
  price_per_night: 100,
  category: "HDB",
  description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
  no_of_guests: 7
)

listing5 = Listing.create(
  user: host1,
  title: "Bungalow in Sentosa Cove",
  subtitle: "Entire house with sea view",
  no_of_rooms: 3,
  location: "1 Cove Avenue, Singapore 098537",
  price_per_night: 900,
  category: "Condo",
  description: "Posh location at Sentosa cove.",
  no_of_guests: 3
)

listing6 = Listing.create(
  user: host1,
  title: "TripleOne. A cozy 3-bedroom apartment in Orchard",
  subtitle: "Entire rental unit in Somerset",
  no_of_rooms: 2,
  location: "313 Orchard Road, Singapore 238895",
  price_per_night: 650,
  category: "Condo",
  description: "Nice condo near Orchard road shopping belt",
  no_of_guests: 2
)

listing7 = Listing.create(
  user: host1,
  title: "Village Hotel Changi-Sup10% OFF",
  subtitle: "Room in hotel in Singapore",
  no_of_rooms: 1,
  location: "1 Netheravon Rd, Singapore 508502",
  price_per_night: 220,
  category: "Hotel",
  description: "Escape from the hustle and bustle of city life and live like a local the natural way at Village Hotel Changi. Located at the east end of Singapore and within the charming and laidback Changi district, the hotel is indeed a breath of fresh air from the usual city hotels.",
  no_of_guests: 2
)

listing8 = Listing.create(
  user: host1,
  title: "Jiujuyuan Cottage",
  subtitle: "Room in Singapore",
  no_of_rooms: 1,
  location: "5 Tampines Avenue 3, Singapore 529705",
  price_per_night: 130,
  category: "HDB",
  description: "Welcome to our brand new apartment in Tampini!Here, you can make your stay as comfortable as possible.",
  no_of_guests: 2
)

Booking.create!(
  start_date: Date.today + 10.days,
  end_date: Date.today + 15.days,
  listing: listing1,
  user: guest0,
  no_of_guests: 2,
  payment: "Visa"
)

Booking.create!(
  start_date: Date.today + 3.days,
  end_date: Date.today + 7.days,
  listing: listing2,
  user: guest0,
  no_of_guests: 1,
  payment: "Visa"
)

Booking.create(
  start_date: Date.today + 1.days,
  end_date: Date.today + 2.days,
  listing: listing3,
  user: guest0,
  no_of_guests: 3,
  payment: "Visa"
)

Booking.create(
  start_date: Date.today + 3.days,
  end_date: Date.today + 7.days,
  listing: listing1,
  user: guest1,
  no_of_guests: 1,
  payment: "Visa"
)

Booking.create(
  start_date: Date.today + 1.days,
  end_date: Date.today + 2.days,
  listing: listing2,
  user: guest1,
  no_of_guests: 2,
  payment: "Visa"
)

Booking.create(
  start_date: Date.today + 7.days,
  end_date: Date.today + 14.days,
  listing: listing3,
  user: guest1,
  no_of_guests: 4,
  payment: "Visa"
)

puts "Data created!"
