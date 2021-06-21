Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  
  resources :users, only: [:show, :index]
  root 'users#index'
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy]
  resources :other_posts, only: [:edit, :update]
  resources :conversations do
    resources :messages
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
