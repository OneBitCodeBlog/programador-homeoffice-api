module API
  module V1
    class KeyWordsController < ApplicationController
      def index
        page = params[:page]
        page_number = page.try(:[], :number)
        per_page = page.try(:[], :size)

        @key_words = KeyWord.all.page(page_number).per(per_page)

        render json: @key_words
      end

      def show
        @key_word = KeyWord.find(params[:id])
        render json: @key_word
      rescue ActiveRecord::RecordNotFound
        head :not_found
      end
    end
  end
end
