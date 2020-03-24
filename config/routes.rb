Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :entries
      resources :reasons

      root to: "users#index"
    end
  get 'dashboard/index'
  resources :entries
  resources :reasons
  devise_for :users
  root to: "dashboard#index" 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
