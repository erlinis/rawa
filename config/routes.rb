#  frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#show'
  get '/dashboard', to: 'dashboard#index'

  get 'auth/auth0/callback', to: 'auth0#callback'
  get 'auth/failure', to: 'auth0#failure'
  get '/logout', to: 'logout#logout'
end
