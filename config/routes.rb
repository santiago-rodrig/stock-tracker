Rails.application.routes.draw do
  get 'my_friends', to: 'friendships#my_friends'
  get 'search_friend', to: 'friendships#search'
  resources :friendships, only: [:create, :destroy]
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  resources :users, only: :show
  root 'static_pages#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
end
