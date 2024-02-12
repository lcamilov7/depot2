Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "store#index"

  resources :products do
    resources :line_items, only: %i[create]
  end
  resources :line_items, only: %i[destroy]
  resources :carts, only: %i[show]
  delete "carts/:id", to: "carts#destroy", as: :cart_delete
end
