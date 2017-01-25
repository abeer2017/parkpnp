class ParkingSpace < ApplicationRecord
  validates :area_no, :cost_per_hour, presence: true

  has_many :bookings, dependent: :destroy
  has_many :requests, dependent: :destroy
end
