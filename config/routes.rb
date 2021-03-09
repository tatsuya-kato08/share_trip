Rails.application.routes.draw do
  get 'maps/index'
  devise_for :users
  root to: "tweets#index"
  resources :tweets
  resources :maps, only: [:index]
end
