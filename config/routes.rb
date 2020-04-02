# frozen_string_literal: true

Rails.application.routes.draw do
  post '/chatbot', to: 'chatbot#webhook'
end
