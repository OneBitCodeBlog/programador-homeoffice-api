# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'home#index'

  mount Sidekiq::Web => '/sidekiq'
  namespace :api do
    namespace :v1 do
      resources :jobs, only: %i[index show]
      get "search_jobs/:tag",  as: :search_jobs, to: "search_jobs#index"
    end
  end
end
