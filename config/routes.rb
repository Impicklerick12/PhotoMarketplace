Rails.application.routes.draw do

  get "/", to: "profiles#home", as: "root"
  get "/how_this_works", to: "profiles#how_this_works", as: "help"

  get "/404", to:"errors#not_found"
  get "/422", to:"errors#unacceptable"
  # get "/500", to:"errors#internal_error"

  resources :listings

  resources :profiles do
    post "reviews", to: "reviews#create"
  end
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
