Rails.application.routes.draw do
  devise_for :users
  resources :products, only: [:new, :index, :create, :show]
  root to: 'products#index'
end
