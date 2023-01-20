Rails.application.routes.draw do
  devise_for :users
  #get 'welcomes/index'
  root "welcomes#index"
  get 'welcomes/about'
  get "welcomes/pushup"
  get "welcomes/neck"
  get "welcomes/curl"
  get "welcomes/dips"

  

  resources :items do

    resources :orders, only: [:index, :create]
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
