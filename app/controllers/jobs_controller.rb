class JobsController < ApplicationController
    def new
      @job = Job.new
      @category = ['Hospital', 'City Hall', 'Dentist', 'General Doctor Visit', 'Apartment Search']
      @urgency = 0
    end
    
    def create
      @job = Job.new(job_params)
        if @job.save
          redirect_to job_path(@job)
        else
          render :new, status: :unprocessable_entity
        end
      end

    def show
      @job = Job.find(params[:id])
    end
end

