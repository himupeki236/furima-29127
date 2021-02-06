Rails.application.routes.draw do
  devise_for :users
  resources :products, only: [:new, :index, :create, :show, :edit, :update]
  root to: 'products#index'
end
