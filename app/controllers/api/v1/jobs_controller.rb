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
    end
  end
end
