Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  # get "/jobs", to: "jobs#index"
  # get "/jobs/:id", to: "jobs#show"
  # get "/users/:id", to: "users#show"
  # patch "/users/:id", to: "users#update"
  # get "/jobs/:id/", to: "jobs#show"
  # post "/jobs/:job_id/bookings", to: "bookings#create"
  # get "/bookings", to: "bookings#index"
  # patch "/bookings/:id", to: "bookings#update"
  # post "/users/:id", to: "users#show"
  # get "/jobs/new", to: "jobs#new"
  # post "/jobs", to: "jobs#create"
  # patch "/bookings/:id", to: "bookings#update"
  # get "interpreter/bookings", to: "interpreter::bookings#index"

  resources :jobs, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :update]
  namespace :translator do
    resources :bookings, only: :index
    # equivalent to => get 'translator/bookings', to: 'translator/bookings#index'
  end
  # Defines the root path route ("/")
end
