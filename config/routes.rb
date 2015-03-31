Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  
  # Routes for registration website Blocca.do
  resources :users, only: [:update, :index]
  get 'users/dashboard'
  get 'users/profile'
  get 'users/regenerate'
  get 'users/reactivate'
  get 'users/deactivate'
  get 'pages/index'
  get 'docs', to: 'pages#docs', as: 'docs'
  root to: 'pages#index'
  
  # Routes for Api Blocca.do 
  namespace :api, defaults: { format: 'json'} do
    resources :users, :only => [:index, :show, :create, :update, :destroy]
    resources :sessions, :only => [:create, :destroy]
  end
end
