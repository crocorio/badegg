Rails.application.routes.draw do
  devise_for :users
  #get 'welcomes/index'
  root "welcomes#index"
  get 'welcomes/about'
  get "welcomes/pushup"
  get "welcomes/neck"
  get "welcomes/curl"
  get "welcomes/dips"
  get "orders/bought"
  get "welcomes/bulk"
  get "welcomes/cutting"
  get "welcomes/health"

  get "japans/jpindex"
  get "japans/jpabout"
  get "japans/jppushup"
  get "japans/jpneck"
  get "japans/jpcurl"
  get "japans/jpdip"
  get "japans/jpbulk"

  resources :items do

    resources :orders, only: [:index, :create]
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
