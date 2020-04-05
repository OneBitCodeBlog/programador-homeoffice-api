module API
  module V1
    class JobsController < ApplicationController
      def index
        page = params[:page]
        page_number = page.try(:[], :number)
        per_page = page.try(:[], :size)

        @jobs = Job.all.page(page_number).per(per_page)

        render json: @jobs
      end

      def show
        @job = Job.find(params[:id])

        render json: @job
      rescue ActiveRecord::RecordNotFound
        head :not_found
      end
    end
  end
end
