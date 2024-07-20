class JobsController < ApplicationController
  def new
    @job = Job.new
  end
  
  def create
    @job = Job.new(job_params)
    @user = current_user
    # @user.id = @job.user_id
    @job.user_id = @user.id
      if @job.save
        redirect_to job_path(@job)
      else
        render :new, status: :unprocessable_entity
      end
  end

  private
  
  def job_params
    params.require(:job).permit(:job_category, :description, :price, :urgency)
  end

end
