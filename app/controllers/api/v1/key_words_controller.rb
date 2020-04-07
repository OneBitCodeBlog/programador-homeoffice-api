module API
  module V1
    class KeyWordsController < ApplicationController
      def index
        page = params[:page]
        page_number = page.try(:[], :number)
        per_page = page.try(:[], :size)
        tag = params[:tag] || ""

        @jobs = Job.includes(:job_key_words)
          .includes(:key_words)
          .where("key_words.tag = ?", tag)
          .references(:key_words)
          .page(page_number).per(per_page)

        render json: @jobs, include: [:jobs]
      end
    end
  end
end
