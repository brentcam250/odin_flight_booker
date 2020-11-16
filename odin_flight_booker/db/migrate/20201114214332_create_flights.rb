class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.datetime :departure_time
      t.string :departing_airport
      t.string :arriving_airport

      t.timestamps
    end
  end
end
