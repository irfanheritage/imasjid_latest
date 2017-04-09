Rails.application.routes.draw do
  get 'home/sidenav'

  get 'home/dashboard'

  namespace :admin do
    resources :users
    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
