# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :jobs, only: %i[index show]
      get "search_jobs/:tag",  as: :search_jobs, to: "search_jobs#index"
    end
  end
end
