class AddPaymentToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :payment, :string
  end
end
