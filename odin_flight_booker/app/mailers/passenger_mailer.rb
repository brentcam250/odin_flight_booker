class PassengerMailer < ApplicationMailer
    default from: 'notifications@example.com'
    
    def welcome_email(passenger)
        # @passenger = params[:passenger]
        @passenger = passenger
        @url = 'http://example.com/login'
        mail(to: @passenger.email, subject: 'Welcome to Odin Flight Booker!')
    end

    def thanks4book_email(booking)
        # @passenger = params[:passenger]
        @booking = booking
        @url = 'http://example.com/login'
        mail(to: @booking.passengers.first.email, subject: 'Thanks for booking with Odin Flight Booker!')
    end
end
