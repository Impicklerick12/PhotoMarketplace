Rails.application.routes.draw do
  get "/404", to:"errors#not_found"
  get "/422", to:"errors#unacceptable"
  get "/500", to:"errors#internal_error"

  get 'categories/index'
  get 'categories/show'

  resources :listings

  resources :profiles do
    post "reviews", to: "reviews#create"
  end

  get "/", to: "profiles#home", as: "root"
  get "/how_this_works", to: "profiles#how_this_works", as: "help"
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
