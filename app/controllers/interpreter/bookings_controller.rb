class Interpreter::BookingsController < ApplicationController
    def index
        #@bookings = current_user.bookings_as_interpreter
        @bookings = Booking.where(user: current_user)
    end
end



