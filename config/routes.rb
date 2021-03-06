Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  resources :sessions, only: [:create, :destroy]
  resources :projects do
    resources :project_comments, except: :show
    resources :tools, only: :new
  end
  get "dashboard", to: 'dashboards#dashboard', as: "dashboard"
  root to: 'home#welcome'
  get "login", to: 'sessions#new', as: "login"
  get "logout", to: 'sessions#destroy', as: "logout"
  get "registration", to: "users#new", as: "registration"
  get '/auth/:provider/callback' => 'sessions#omniauth'
end