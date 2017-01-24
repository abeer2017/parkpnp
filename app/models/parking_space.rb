class ParkingSpace < ApplicationRecord
  validates :area_no, :cost_per_hour, presence: true

  has_many :bookings
  has_many :requests
end
