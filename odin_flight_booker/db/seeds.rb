# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


airports = Airport.create([{ id: 1, name: "YYC" }, { id: 2, name: "YVR" }, { id: 3, name: "YYZ" }, { id: 4, name: "YEG" }])

flights = Flight.create([{ id: 1, departure_time: "2020-12-01 12:30:00", from_airport_id: 1, to_airport_id: 2}, 
{ id: 2, departure_time: "2020-12-01 13:30:00", from_airport_id: 2, to_airport_id: 3},
{ id: 3, departure_time: "2020-12-01 14:30:00", from_airport_id: 3, to_airport_id: 1},
{ id: 4, departure_time: "2020-12-01 15:30:00", from_airport_id: 3, to_airport_id: 2},
{ id: 5, departure_time: "2020-12-01 16:30:00", from_airport_id: 2, to_airport_id: 1},
{ id: 6, departure_time: "2020-12-01 17:30:00", from_airport_id: 1, to_airport_id: 3}])
