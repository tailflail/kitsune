Rails.application.routes.draw do
  root "static#home"

  get "home", to: "static#home", as: "home"

  devise_for :users do
    get ""
  end

  resources :posts
  resources :users, only: [:show], param: :username
end
