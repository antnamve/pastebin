Rails.application.routes.draw do
  if Rails.env.development? || Rails.env.test?
    mount Railsui::Engine, at: "/railsui"
  end
  
  # Inherits from Railsui::PageController#index
  # To overide, add your own page#index view or change to a new root
  # Visit the start page for Rails UI any time at /railsui/start
  # root action: :index, controller: "railsui/page"
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "page#about"
  resources :pastes, except: :show
  get 'about', to: 'page#about'
  get 'paste', to: 'page#show'
end
