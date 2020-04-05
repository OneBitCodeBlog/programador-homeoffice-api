# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :jobs, only: %i[index show]
      resources :key_words, only: %i[index show]
    end
  end
end
