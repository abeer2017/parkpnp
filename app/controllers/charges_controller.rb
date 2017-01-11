class ChargesController < ApplicationController

  def new
    @request = Request.find(params[:format])
    @booking = Booking.new
  end

  def create
    @request = Request.find params[:request_id]
    @amount = @request.total_cost.to_i*100
    @booking = Booking.new(stripe_token: params[:stripeToken], parking_space_id: @request.parking_space_id, start_time: @request.start_time, end_time: @request.end_time, total_cost: @request.total_cost, user_id: @request.user_id)
    @booking.save!
    
    #Service
    CreditCardService.new({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      amount: @amount
      }).payment
  end
end
