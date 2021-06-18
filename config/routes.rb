Rails.application.routes.draw do
  get 'other_posts/new'
  get 'other_posts/edit'
  get 'other_posts/confirm'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show]
  root 'posts#index'
  resources :posts do
    collection do
      post :confirm
    end
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  resources :favorites, only: [:create, :destroy]
  resources :other_posts
end
