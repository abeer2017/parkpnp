class Booking < ApplicationRecord
  belongs_to :user
  before_create :total_cost

  private
  def total_cost
    st = self.end_time.strftime("%H").to_i
    et = self.start_time.strftime("%H").to_i
    self.total_cost = (st - et)
  end
end
