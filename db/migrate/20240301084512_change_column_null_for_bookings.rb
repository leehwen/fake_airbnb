class ChangeColumnNullForBookings < ActiveRecord::Migration[7.1]
  def change
    change_column_null :bookings, :start_date, false
    change_column_null :bookings, :end_date, false
    change_column_null :bookings, :no_of_guests, false
  end
end
