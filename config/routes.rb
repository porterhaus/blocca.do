Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  resources :users, only: [:update, :index]
  get 'users/dashboard'
  get 'users/profile'
  get 'users/regenerate'

  get 'pages/index'
  get 'docs', to: 'pages#docs', as: 'docs'

  root to: 'pages#index'
end
