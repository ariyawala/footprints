Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'top#index'

  resources :users, only: [:show]
  resources :articles do
    resources :comments, only: [:create]
    resources :iines, only: [:create, :destroy]
  end
end
