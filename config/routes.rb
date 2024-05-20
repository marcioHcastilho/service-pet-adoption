require 'sidekiq/web'

Rails.application.routes.draw do
  root to: redirect('/swagger-ui/docs/index.html') 
  mount Sidekiq::Web => '/sidekiq'

  resources :pets, only: [:create, :update, :destroy, :index, :show]
  resources :owners, only: [:create, :update, :destroy, :index, :show]

  namespace :api do
    get "up" => "rails/health#show", as: :rails_health_check
  end
end
