class Airport < ApplicationRecord
    has_many :arriving_flights, foreign_key: "to_airport", class_name: "Flight"
    has_many :departing_flights, foreign_key: "from_airport", class_name: "Flight"

end
