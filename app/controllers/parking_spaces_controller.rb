class ParkingSpacesController < ApplicationController

  def index
    @parking_spaces = ParkingSpace.all
  end

  def new
    @parking_space = ParkingSpace.new
  end

  def create
    @parking_space = ParkingSpace.new(parking_space_params)
 
    if @parking_space.save
      @parking_spaces = ParkingSpace.all
      render action: 'index'
    else
      render 'new'
    end
  end

  def show
    @parking_space = ParkingSpace.find(params[:id])
  end

  def destroy
    @parking_spaces = ParkingSpace.all
    @parking_space = ParkingSpace.find(params[:id])
    @parking_space.destroy
    render action: 'index'
  end

private
  def parking_space_params
    params.require(:parking_space).permit(:area_no, :cost_per_hour, :available, :instant_booking)
  end

end
