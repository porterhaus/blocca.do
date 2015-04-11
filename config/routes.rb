Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  # Routes for Registration Website Blocca.do
  # resources :users, only: [:update, :index]
  get '/auth', to: 'users#index', as: 'auth'
  get 'users/profile'
  get 'users/regenerate'
  get 'users/reactivate'
  get 'users/deactivate'
  get '/docs', to: 'docs#index', as: 'docs'
  get 'pages/index'
  root to: 'pages#index'

  # Routes for Api Blocca.do
  namespace :api, defaults: { format: 'json'} do
    resources :sessions, :only => [:create, :destroy]
    resources :users, :only => [:create, :update, :destroy]
    resources :lists do
      resources :tasks
    end
  end
end
