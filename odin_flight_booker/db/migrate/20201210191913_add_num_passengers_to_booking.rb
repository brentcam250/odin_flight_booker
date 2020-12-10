class AddNumPassengersToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :num_passengers, :integer
  end
end
