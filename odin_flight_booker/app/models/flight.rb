class Flight < ApplicationRecord
    belongs_to :to_airport, class_name: "Airport"
    belongs_to :from_airport, class_name: "Airport"

    def flight_date_formatted
        departure_date = departure_time.strftime("%m/%d/%y")
    end

    def self.get_flight_dates
        Flight.find_by_sql("select distinct departure_time from flights where departure_time is not null order by departure_time desc")
    end
end
