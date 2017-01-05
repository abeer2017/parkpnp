class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :parking_space
  before_create :cal_total_cost
  
  def cal_total_cost
    parking_space = ParkingSpace.where(:id =>  self.parking_space_id).first
    cost = parking_space.cost_per_hour
    st = self.end_time.strftime("%H").to_i
    et = self.start_time.strftime("%H").to_i
    self.total_cost = (st - et)*cost
  end
end
