class AddParkingSpaceIdToBookings < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :parking_space, foreign_key: true
  end
end
