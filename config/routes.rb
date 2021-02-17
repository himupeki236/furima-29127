Rails.application.routes.draw do
  devise_for :users
  # resources :products, only: [:new, :index, :create, :show, :edit, :update, :destroy]
  resources :products do
    # 詳細画面の商品idをリクエストとして渡すためにネストさせる
    resources :orders, only: [:create, :index]
  end
  root to: 'products#index'
end
