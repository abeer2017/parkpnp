class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @user = current_user
    @booking = @user.bookings.create(booking_params)
    redirect_to parking_spaces_path
  end
 
  private
    def booking_params
      params.require(:booking).permit(:total_cost, :start_time, :end_time, :parking_space_id)
    end
end
