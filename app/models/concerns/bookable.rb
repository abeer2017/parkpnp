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
    cost_calculation(parking_space)
  end

  private
  def cost_calculation(parking_space)
    cost = parking_space.cost_per_hour
    start_time = self.start_time #Start Date
    end_time = self.end_time #End Date
    day_diff = (end_time - start_time).to_i / (24 * 60 * 60) #difference between dates
    if day_diff == 0
      start_time = self.start_time.strftime("%H").to_i # Start Time
      end_time = self.end_time.strftime("%H").to_i # End Time
      self.total_cost = (end_time - start_time)*cost
    else day_diff >= 1
      start_time = 24 - (self.start_time.strftime("%H").to_i) # Start Time
      end_time = self.end_time.strftime("%H").to_i # End Time
      self.total_cost = (((day_diff-1)*24)+start_time+end_time)*cost
    end
  end
end