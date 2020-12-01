class Flight < ApplicationRecord
    belongs_to :to_airport, class_name: "Airport"
    belongs_to :from_airport, class_name: "Airport"
    has_many :bookings
    has_many :passengers, through: :bookings

    def flight_date_formatted
        departure_date = departure_time.strftime("%m/%d/%y")
    end

    def flight_time_formatted
        departure_only_time = departure_time.strftime("%h/%m")
    end

    def self.get_flight_dates
        #MyTable.pluck("distinct date(updated_at)") 
        #Flight.find_by_sql("select distinct departure_time from flights where departure_time is not null order by departure_time desc")
        
        Flight.pluck("distinct date(departure_time)")
        # Flight.find_by_sql("select distinct date(departure_time) from flights order by departure_time desc")

    end
end
