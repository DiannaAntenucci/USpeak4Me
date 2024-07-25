class Interpreter::BookingsController < ApplicationController
    def index
        raise
        @bookings = Booking.all
        #need to grab own bookings

    def update
        @booking = Booking.find(params[:id])
        if @booking.update(booking_params)
        # redirect_to # up to you...
        else
        # render # where was the booking update form?
        end
    end

private
    def booking_params
    # TODO: check your model, might be different than mine
    params.require(:booking).permit(:status, :start_time, :end_time)
        end
    end
end
