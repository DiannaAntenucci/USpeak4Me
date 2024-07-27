class JobsController < ApplicationController
  def index
    if params[:query].present?
      @jobs = Job.search_by_job_category_and_address_and_description(params[:query])
      flash[:notice] = "There are no results for the search" if @jobs.empty?
    else
      @jobs = Job.all
    end
  end

  def show
    @booking = Booking.new
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @category = ['City Hall', 'Hospital','Dentist', 'Doctor Visit', 'Apartment Search', 'Document Translation', 'Other']
    @urgency = 0
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to job_path(@job)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def job_params
    params.require(:job).permit(:job_category, :address, :description, :date, :price, :urgency)
  end
end
