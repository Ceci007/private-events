Rails.application.routes.draw do
  resources :users
  root to: 'users#index'

  resources :user_sessions, only: [:new, :create, :destroy]
  get 'login' => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'
end
