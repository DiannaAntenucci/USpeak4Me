class Interpreter::BookingsController < ApplicationController
    def index
        raise
        @bookings = Booking.all
        #need to grab own bookings
    end
end
