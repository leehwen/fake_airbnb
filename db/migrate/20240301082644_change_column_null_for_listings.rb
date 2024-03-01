class ChangeColumnNullForListings < ActiveRecord::Migration[7.1]
  def change
    change_column_null :listings, :category, false
    change_column_null :listings, :no_of_rooms, false
    change_column_null :listings, :location, false
    change_column_null :listings, :price_per_night, false
    change_column_null :listings, :no_of_guests, false
    change_column_null :listings, :description, false
    change_column_null :listings, :title, false
    change_column_null :listings, :subtitle, false
  end
end
