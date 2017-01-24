# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!([{name: 'John Doe', email: 'admin@parkpnp.com', role: true, password: '12345678', password_confirmation: '12345678'},
      {name: 'Mike', email: 'user@parkpnp.com', role: false, password: '12345678', password_confirmation: '12345678'}])
parking_space = ParkingSpace.create!([{area_no: "A1", cost_per_hour: "10", available: true},
                {area_no: "B2", cost_per_hour: "7", available: true},
                {area_no: "C3", cost_per_hour: "4", available: true}])
