class PassengerMailer < ApplicationMailer
    default from: 'notifications@example.com'
    
    def welcome_email(passenger)
        # @passenger = params[:passenger]
        @passenger = passenger
        @url = 'http://example.com/login'
        mail(to: @passenger.email, subject: 'Welcome to Odin Flight Booker!')
    end
end
