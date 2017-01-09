class ChargesController < ApplicationController

  def new
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.find params[:booking_id]
    @amount = @booking.total_cost.to_i*100

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
