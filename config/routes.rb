Rails.application.routes.draw do
  get 'tools/new'
  get 'tools/create'
  get 'tools/destroy'
  get 'projects/new'
  get 'projects/create'
  get 'projects/edit'
  get 'projects/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  resources :sessions, only: [:create, :destroy]
  get "dashboard", to: 'dashboards#dashboard', as: "dashboard"
  get "/", to: 'users#index', as: "index"
  get "login", to: 'sessions#new', as: "login"
  get "logout", to: 'sessions#destroy', as: "logout"
  get "registration", to: "users#new", as: "registration"
end