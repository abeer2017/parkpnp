class ParkingSpace < ApplicationRecord
  has_many :bookings
end
