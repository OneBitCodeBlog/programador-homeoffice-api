module API
  module V1
    class KeyWordsController < ApplicationController
      def index
        @key_words = KeyWord.all
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
