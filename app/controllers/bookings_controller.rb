class BookingsController < ApplicationController
    def index
        @bookings = current_user.bookings_as_owner
    end

    def new
        @booking = Booking.new
        @job = Job.find(params[:job_id])
    end

    def create
        @job = Job.find(params[:job_id])
        @booking = Booking.new()
        @booking.user = current_user
        @booking.job = @job
        @booking.status = "pending"
        
        if @booking.save
            redirect_to job_path(@job)
        else
            render :new, status: :unprocessable_entity
            raise
        end
    end

    private

    # def booking_params
    #     params.require(:booking).permit(:job_id)
    # end
end