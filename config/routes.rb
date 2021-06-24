Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # devise_for :users, controllers: {
  #   registrations: 'users/registrations',
  #   passwords: 'users/passwords'
  # }
  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    post 'users/admin_guest_sign_in', to: 'users/sessions#new_admin_guest'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  root to: "users#index"

  resources :users, only: [:show, :index]
  
  resources :posts do
    resources :other_posts
    collection do
      post :confirm
    end
  end

  resources :favorites, only: [:create, :destroy]
  
  resources :conversations do
    resources :messages
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
