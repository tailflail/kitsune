Rails.application.routes.draw do
  root "static#home"

  get "home", to: "static#home", as: "home"

  devise_for :users

  resources :posts do
    resources :comments, except: [:new, :show, :index]
  end

  resources :users, only: [:show], param: :username do
    member do
      get "following", to: "users#following", as: "following"
      get "followers", to: "users#followers", as: "followers"
    end
  end
end
