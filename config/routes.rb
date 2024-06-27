Rails.application.routes.draw do
  # Static pages routes
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'

  # User and session routes
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  # Blog and favorites routes
  resources :blogs do
    resources :favorites, only: [:create, :destroy]
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
