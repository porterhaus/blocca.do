Rails.application.routes.draw do
  get 'pages/index'
  get 'docs', to: 'pages#docs', as: 'docs'

  root to: 'pages#index'
end
