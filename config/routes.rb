Rails.application.routes.draw do
  root "home#index"

  get "home", to: "static#home", as: "home"

  devise_for :users

  resources :posts
  resources :users, only: [:show], param: :username
end
