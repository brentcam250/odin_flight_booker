class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    # flight = booking_params[:flight]
    # @flight = Flight.find(flight)

    #if no passenger number passed in, make default 1 passenger
    # @num_passengers = params[:num_passengers].empty? ? 1 : params[:num_passengers]
    # @booking = @flight.bookings.build(booking_params)

    # @booking_params = booking_params

    #confusing about passing the id, when it actually expects the object
    @booking = Booking.new

    # @flight = Flight.find(params[:booking][:flight_id])
    @flight = Flight.find(booking_params[:flight_id])

    @num_passengers = booking_params[:num_passengers]

    @num_passengers.to_i.times do 
      @booking.passengers.build
    end
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create


    # @flight = Flight.find(booking_params[:flight])

    # @booking = Booking.new({:flight => @flight, passengers_attributes: 
    # [{name: "brent", email: "email"}
    # ]})
    @booking = Booking.new(booking_params)
    



    respond_to do |format|
      if @booking.save
        # @passenger = @booking.passengers.first
        
        #trigger thank you email
        PassengerMailer.with(booking: @booking).thanks4book_email.deliver_now!


        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      # params.require(:booking).permit(:flight_id, passengers_data: [:id, :name, :email])
      params.require(:booking).permit(:flight_id, :passengers, :num_passengers, passengers_attributes: [ :name, :email ])


    end

    # def flight_params
    #   # params.fetch(:flight, {})
    #   params.require(:flight).permit(:from_airport_id, :to_airport_id, :departure_date, :num_passengers)
    # end
end
