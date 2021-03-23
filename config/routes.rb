Rails.application.routes.draw do
  get 'maps/index'
  devise_for :users
  root to: "tweets#index"
  resources :tweets do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  get '/map_request', to: 'maps#map', as: 'map_request'
  resources :maps, only: [:index, :map]
end
