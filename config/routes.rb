Rails.application.routes.draw do

  devise_for :customers
  get 'home/index'

#Casein routes
namespace :casein do
    resources :items
    resources :customers
end

root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
