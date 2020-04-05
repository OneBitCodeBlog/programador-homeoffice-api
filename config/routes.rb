# frozen_string_literal: true

Rails.application.routes.draw do
<<<<<<< HEAD
  post '/chatbot', to: 'chatbot#webhook'
=======
  namespace :api do
    namespace :v1 do
      resources :jobs, only: %i[index show]
    end
  end
>>>>>>> c8d0479a3f74306a0735073fb3315c89a9bc32fc
end
