module Bookable
  extend ActiveSupport::Concern

  included do
    belongs_to :user
    belongs_to :parking_space
    before_create :cal_total_cost
    # before_create :availability
  end

  def cal_total_cost
    parking_space = ParkingSpace.where(:id =>  self.parking_space_id).first
    cost = parking_space.cost_per_hour
    et = self.end_time.strftime("%H").to_i
    st = self.start_time.strftime("%H").to_i
    self.total_cost = (et - st)*cost
  end

  # def availability
  #   parking_space = ParkingSpace.where(:id =>  self.parking_space_id).first
  #   parking_space.available = false
  # end

end