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

    def update
      @booking = Booking.find(params[:id])
      if @booking.update(booking_params)
    # redirect_to # up to you...
    redirect_to interpreter_bookings_path
      else
    # render # where was the booking update form?
      end
    end

    private
    def booking_params
    # TODO: check your model, might be different than mine
      params.require(:booking).permit(:status, :start_time, :end_time)
    end
  
    private

    # def booking_params
    #     params.require(:booking).permit(:job_id)
    # end
end