class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @user = current_user
    @booking = @user.bookings.create(booking_params)
    redirect_to user_booking_path(@user, @booking)
  end

  def show
    @booking = Booking.find(params[:id])
    @user = current_user
    @parking_space = ParkingSpace.where(:id =>  @booking.parking_space_id).first
  end
 
  private
    def booking_params
      params.require(:booking).permit(:total_cost, :start_time, :end_time, :parking_space_id)
    end
end
