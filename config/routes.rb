Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"


  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Nested resources for reviews under users
  resources :users, only: %i[show new create] do
    get "/followers", to: "follows#followers"
    resource :follow, only: %i[create destroy]
    resources :reviews, only: [:new, :create, :destroy]
  end
end
