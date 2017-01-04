class CreateParkingSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :parking_spaces do |t|
      t.string :area_no
      t.decimal :cost_per_hour
      t.boolean :available
      t.boolean :instant_booking

      t.timestamps
    end
  end
end
