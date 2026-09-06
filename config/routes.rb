Rails.application.routes.draw do
  #Reources
  resources :elections, only: [:index, :new, :create, :edit, :update] do
    member do
      patch :activate
      patch :deactivate
    end
    
    resources :candidates, only: [:index, :new, :create, :edit, :update] do
      member do
        patch :activate
        patch :deactivate
      end
    end

    resources :votes, only: [:create]
  end

  # Devise
  devise_for :users
  
  # Get
  get "home/index"
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
