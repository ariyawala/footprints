Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'

  resources :users, only: :show
  resources :articles do
    resources :comments, only: [:create]
  end
end
