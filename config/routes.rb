Rails.application.routes.draw do
  get 'projects/new'
  get 'projects/create'
  get 'projects/show'
  get 'properties/search'
  get 'properties/new'
  get 'properties/create'
  get 'leads/new'
  get 'leads/create'
  get 'simulations/index'
  get 'simulations/create'
  get 'simulations/new'
  get 'simulations/edit'
  get 'simulations/update'
  get 'simulations/destroy'
  devise_for :users

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :projects, only: [:show, :new, :create] do
    resources :simulations, only: [:new, :create]
  end
  resources :cities, only: [:show]

  get "dashboard", to: "dashboard#profile"

  get "properties/search", to: "properties#search"

  resources :simulations, only: [:show] do
    resources :leads, only: [:new, :create]
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
