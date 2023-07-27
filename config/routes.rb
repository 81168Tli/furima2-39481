Rails.application.routes.draw do
  get 'orders/index'
  devise_for :users
  #get 'items/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "items#index"

  resources :items do
    resources :orders 
  end
end
