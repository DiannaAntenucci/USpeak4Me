class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
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
