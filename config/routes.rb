Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
    passwords: 'passwords'
  }
  
  get 'pages/index'
  get 'docs', to: 'pages#docs', as: 'docs'


  root to: 'pages#index'
end
