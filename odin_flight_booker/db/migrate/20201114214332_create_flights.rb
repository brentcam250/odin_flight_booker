class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.datetime :departure_time
      t.references :from_airport, null: false, foreign_key: { to_table: :airports }, index: true
      t.references :to_airport, null: false, foreign_key: { to_table: :airports }, index: true

      t.timestamps
    end
  end
end
