Rails.application.routes.draw do
  devise_for :users
  resources :products, only: [:new, :index, :create]
  root to: 'products#index'
end
