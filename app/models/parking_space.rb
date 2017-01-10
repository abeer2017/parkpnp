class ParkingSpace < ApplicationRecord
  has_many :bookings
  has_many :requests
end
