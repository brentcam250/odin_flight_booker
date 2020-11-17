class Flight < ApplicationRecord
    belongs_to :to_airport, class_name: "Airport"
    belongs_to :from_airport, class_name: "Airport"

    def flight_date_formatted
        event_date.strftime("%m/%d/%y")
    end

    # def get_flight_by_date
    #     Flight.find_by_sql("select distinct departure_time from flight.departure_time where departure_time is not null order by departure_time desc")
    # end
end
