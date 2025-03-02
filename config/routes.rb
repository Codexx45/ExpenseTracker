Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users  # Ensure this line is present

  # Other routes
  namespace :admin do
    get "dashboard", to: "dashboard#index"
    resources :expenses
    resources :users
    resources :dashboard, only: [ :index ]
  end

  # Regular resources
  resources :expenses, except: [ :show ]

  # Root route
  root "expenses#index"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA routes (commented out)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
