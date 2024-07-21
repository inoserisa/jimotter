Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: [:show, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "static_pages#top"

  get 'about', to: 'static_pages#about'
  get 'cancel_membership', to: 'static_pages#cancel_membership'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'terms', to: 'static_pages#terms'

  delete 'destroy_user', to: 'static_pages#destroy_user'

  resources :posts do
    resources :comments, only: [:create, :destroy]
    collection do
      get :bookmarks
    end
  end

  resources :questions do
    resources :answers, only: [:create, :destroy]
  end

  resources :cities, only: [:index]

  resources :bookmarks, only: [:create, :destroy]

  resources :notifications, only: [:index] do
    collection do
      patch :mark_as_read
    end
  end
end
