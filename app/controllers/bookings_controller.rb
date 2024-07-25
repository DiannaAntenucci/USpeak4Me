class BookingsController < ApplicationController

    def new
        @booking = Booking.new
        @job = Job.find(params[:job_id])
    end

    def create
        @job = Job.find(params[:job_id])
        @booking = Booking.new()
        @booking.user_id = current_user
        @booking.job = @job
        @booking.status = "accepted"
        @booking.create(booking_params)
        raise
        
        if @booking.save
            redirect_to job_path(@booking.job_id)
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def booking_params
        params.require(:booking).permit(:status, :job_id)
    end
end