class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  # GET /flights
  # GET /flights.json
  def index
    @selected_date = ((params[:flight].nil? || params[:flight][:flight_date_formatted].empty?) ? (Date.today) : (Date.parse(params[:flight][:flight_date_formatted])))
      # @selected_date = Date.parse(params[:departure_date])
    
    # @flights = (params[:flight].nil? ? Flight.all : Flight.where(flight_params)).includes(:from_airport, :to_airport, :departure_time => @selected_date.beginning_of_day..@selected_date.end_of_day).order(:departure_time).limit(10)
    
    # @flights = (params[:flight].nil? ? Flight.all : Flight.where(flight_params)).includes(:from_airport, :to_airport).order(:departure_time).limit(10)
    # Flight.where(:departure_time => s.beginning_of_day..s.end_of_day)

    # @flights = (params[:flight].nil? ? Flight.all : Flight.where('departure_time >= :start_date AND departure_time <= :end_date AND from_airport_id = ? AND to_airport_id = ?', {start_date: @selected_date.beginning_of_day, end_date: @selected_date.end_of_day, :from_airport_id, :to_airport_id}))
    
    #long query finally works for all the params
    @flights = (params[:flight].nil? ? Flight.all : Flight.where(departure_time: 
    (@selected_date.beginning_of_day..@selected_date.end_of_day), from_airport: params[:flight][:from_airport_id],
    to_airport: params[:flight][:to_airport_id]))

    # works for just the date, but not searching for airports as well.
    # @flights = (params[:flight].nil? ? Flight.all : Flight.where(:departure_time => @selected_date.beginning_of_day..@selected_date.end_of_day).order(:departure_time).limit(10))

    @airport_options = Airport.all.map{ |a| [a.name, a.id] }
    @flight_date_options = Flight.get_flight_dates

    @flight = (@flights[0].nil? ? Flight.first : @flights[0])


    @num_passengers = (params[:flight].nil? || params[:flight][:passengers].empty?) ? 1 : params[:flight][:passengers]
    @booking = Booking.new
    @from_airport_id = params[:from_airport_id]
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
    # @flight = Flight.find(:id)
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights
  # POST /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: 'Flight was successfully created.' }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1
  # PATCH/PUT /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: 'Flight was successfully updated.' }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url, notice: 'Flight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      # params.fetch(:flight, {})
      params.require(:flight).permit(:from_airport_id, :to_airport_id, :departure_date, :num_passengers, :departure_time, :flight_date_formatted)
    end


end
