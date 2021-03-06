Rails.application.routes.draw do
  root to: "static#index"
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  get '/auth/github/callback', to: 'sessions#omniauth'
  
  
  resources :users do
    resources :children
    resources :outings
  end
  resources :children, except: [:new]
  resources :outings
  resources :activities
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
