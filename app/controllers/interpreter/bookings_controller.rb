class Interpreter::BookingsController < ApplicationController
    def index
        @jobs = Job.all
    end
end
