Rails.application.routes.draw do
  devise_for :users
  #get 'welcomes/index'
  get 'welcomes/about'
  get "welcomes/pushup"
  get "welcomes/neck"
  get "welcomes/curl"
  get "welcomes/dips"

  root "welcomes#index"

  resources :items 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
