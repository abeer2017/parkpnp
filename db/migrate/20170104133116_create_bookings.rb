class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :total_cost
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
