Rails.application.routes.draw do
  root "static#home"

  get "home", to: "static#home", as: "home"

  devise_for :users

  resources :posts do
    resources :comments, except: [:show, :index]
  end
  resources :users, only: [:show], param: :username
end
