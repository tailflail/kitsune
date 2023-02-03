Rails.application.routes.draw do
  root "static#home"

  get "home", to: "static#home", as: "home"

  devise_for :users

  resources :posts do
    resources :comments, except: [:new, :show, :index]
  end

  resources :users, only: [:show], param: :username do
    member do
      get "gallery", to: "users#gallery", as: "gallery"
      get "following", to: "users#following", as: "following"
      get "followers", to: "users#followers", as: "followers"
      get "favorites", to: "users#favorites", as: "favorites"
    end
  end

  resources :user_relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
