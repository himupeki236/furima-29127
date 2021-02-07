Rails.application.routes.draw do
  devise_for :users
  # resources :products, only: [:new, :index, :create, :show, :edit, :update, :destroy]
  resources :products
  root to: 'products#index'
end
