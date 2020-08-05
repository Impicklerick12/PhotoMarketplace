Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  resources :listings

  resources :profiles do
    post "reviews", to: "reviews#create"
  end

  get "/", to: "profiles#home", as: "root"
  get "/404", to: "profiles#not_found"
  get "/how_this_works", to: "profiles#how_this_works", as: "help"
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
