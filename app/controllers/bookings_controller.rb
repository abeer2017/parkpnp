class BookingsController < ApplicationController

  def create
    @user = current_user
    @booking = @user.booking.create(booking_params)
    redirect_to parking_spaces_path
  end
 
  private
    def booking_params
      params.require(:booking).permit(:total_cost, :start_time, :end_time)
    end
end
