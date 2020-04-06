# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :jobs, only: %i[index show]
      get "key_words/:tag/jobs", to: "key_words#index"
    end
  end
end
