class ChargesController < ApplicationController

  def new
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.find params[:booking_id]
    @amount = @booking.total_cost.to_i*100

    #Service
    CreditCardService.new({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      amount: @amount
      }).payment
  end
end
