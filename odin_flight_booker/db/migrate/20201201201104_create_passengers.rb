class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string "name"
      t.string "email"
      t.references :booking, null: false, foreign_key: { to_table: :bookings }, index: true

      t.timestamps
    end
  end
end
