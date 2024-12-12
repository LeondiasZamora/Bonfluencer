Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Nested resources for reviews under users
  resources :users, only: :show do
    resource :follow, only: %i[create destroy]
    resources :reviews, only: [:index, :new, :create, :destroy]
  end
end
