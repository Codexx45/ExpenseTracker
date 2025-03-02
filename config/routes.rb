Rails.application.routes.draw do
  namespace :admin do  # Fix: Add colon `:admin`
    get 'dashboard', to: "dashboard#index"
    resources :expenses
    resources :users
    resources :dashboard, only: [:index]
  end

  resources :expenses, except: [:show]

  root "expenses#index"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA routes (commented out)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end