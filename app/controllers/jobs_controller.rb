class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @category = ['Hospital', 'City Hall', 'Dentist', 'General Doctor Visit', 'Apartment Search']
    @urgency = 0
  end

  def create
    @job = Job.new(job_params)
    # @user = current_user
    @job.user= current_user
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
