Rails.application.routes.draw do

  #get 'order/create'

  #get 'order/address_confirm'

  #get 'order/show'
  resources :order, only: [:index,:create] do
    collection do
      get 'address_confirm'
      post 'address_change'
    end
  end

  devise_for :customers

  resources :home, only: [:index]

  resources :cart, only: [:show] do
    collection do
      post 'add_item'
      post 'update_item'
    end
  end

  #Casein routes
  namespace :casein do
      resources :items
      resources :customers
  end

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
