Rails.application.routes.draw do
  resources :activities
  root to: "static#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  get '/auth/github/callback', to: 'sessions#omniauth'
  
  
  resources :users do
    resources :children, only: [:show, :index, :new, :edit]
  end
  resources :children, except: [:new]

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
