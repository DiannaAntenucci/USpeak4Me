class PagesController < ApplicationController
  def home
    # Limits the amount of jobs in the homepage to only 3
    @jobs = Job.limit(3)
  end
end
