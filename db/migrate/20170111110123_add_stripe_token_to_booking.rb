class AddStripeTokenToBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :stripe_token, :string
  end
end
