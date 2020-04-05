module API
  module V1
    class JobsController < ApplicationController
      def index
        @jobs = Job.all

        render json: @jobs
      end
    end
  end
end
