Rails.application.routes.draw do
<<<<<<< HEAD
=======
  devise_for :users
>>>>>>> 7916aad (Added login and sign up page)
  namespace :admin do
    get "dashboard/index"
  end
  get "expenses/index"
  get "expenses/new"
  get "expenses/create"
  get "expenses/edit"
  get "expenses/update"
  get "expenses/destroy"

  root "expenses#index"
  namespace :admin do
    get 'dashboard', to: "dashboard#index"
    resources :expenses
    resources :users
  end
  resources :expenses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
